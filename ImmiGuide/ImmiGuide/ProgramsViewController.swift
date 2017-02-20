//
//  ProgramsViewController.swift
//  ImmiGuide
//
//  Created by Cris on 2/18/17.
//  Copyright © 2017 Madushani Lekam Wasam Liyanage. All rights reserved.
//

import UIKit

private let cellID = "cellID"
private let gedCellID = "GEDCell"
private let segueID  = "SegueToProgramDetails"

class ProgramsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var gedLocations = [GED]()
    var rwLocations = [ReadingWritingLiteracyPrograms]()
    var dict = [String : String]()
    var filteredAgeDict = [String : [ReadingWritingLiteracyPrograms]]()
    
    @IBOutlet weak var programsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        programsTableView.delegate = self
        programsTableView.dataSource = self
        self.getGEDData()
        self.getReadingData()
        programsTableView.estimatedRowHeight = 125
        programsTableView.rowHeight = UITableViewAutomaticDimension
        self.navigationController?.navigationBar.barTintColor = UIColor(red:1.00, green:0.36, blue:0.36, alpha:1.0)
        programsTableView.preservesSuperviewLayoutMargins = false
        programsTableView.separatorInset = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15)
        programsTableView.layoutMargins = UIEdgeInsets.zero
        programsTableView.separatorColor = UIColor.darkGray
    }
    
    func getGEDData() {
        let endpoint = APIRequestManager.gedAPIEndPoint
        APIRequestManager.manager.getData(endPoint: endpoint) { (data) in
            guard let validData = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: validData, options: [])
                guard let jsonDict = json as? [[String : Any]] else { return }
                for object in jsonDict {
                    guard let gedObject = GED(fromDict: object) else { return }
                    self.gedLocations.append(gedObject)
                }
                DispatchQueue.main.async {
                    self.programsTableView.reloadData()
                    self.animateCells()
                }
            }
            catch {
                print(error)
            }
        }
    }
    
    func getReadingData() {
        let endpoint = APIRequestManager.literacyProgramsAPIEndPoint
        APIRequestManager.manager.getData(endPoint: endpoint) { (data) in
            guard let validData = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: validData, options: [])
                guard let jsonDict = json as? [[String : Any]] else { return }
                for object in jsonDict {
                    guard let rwObject = ReadingWritingLiteracyPrograms(fromDict: object) else { return }
                    self.rwLocations.append(rwObject)
                }
                DispatchQueue.main.async {
                    self.getCategoriesAndRefresh()
                    self.sortRWBy()
                    self.animateCells()
                }
            }
            catch {
                print(error)
            }
        }
    }
    
    func getCategoriesAndRefresh() {
        for loc in rwLocations {
            let program = loc.program
            let age = loc.ageGroup
            dict[program] = age
        }
    }
    
    func sortRWBy() {
        let categories = dict.keys.sorted()
        for cat in categories {
            let filteredByAgeArr = rwLocations.filter{$0.program == cat}
            filteredAgeDict[cat] = filteredByAgeArr
        }
        self.programsTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return dict.keys.count
        default:
            break
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch  indexPath.section {
        case 0:
            cell = programsTableView.dequeueReusableCell(withIdentifier: gedCellID, for: indexPath)
            if let cell = cell as? GEDTableViewCell {
                guard let languageDict = Translation.programVC["English"] as? [String : String],
                    let labelText = languageDict["GED"] else { return cell }
                cell.gedLabel.text = ("\(labelText)/ College Prep")
                cell.gedLabel.font = UIFont(name: "Montserrat-Light", size: 25)
                cell.gedLabel?.textColor = UIColor.darkGray
            }
        case 1:
            let cat = dict.keys.sorted()
            let category = cat[indexPath.row]
            cell = programsTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
            if let cell = cell as? ProgramTableViewCell {
                if let languageDict = Translation.programVC["Spanish"] as? [String : String],
                    let labelTextName = languageDict[category] {
                    
                    cell.nameOfProgram.text = labelTextName
                    cell.nameOfProgram.font = UIFont(name: "Montserrat-Light", size: 25)
                    cell.nameOfProgram?.textColor = UIColor.darkGray
                    
                    DispatchQueue.main.async {
                        dump(self.dict)
                        if  let age = self.dict[category] {
                            if let ageText = languageDict[age] {
                                cell.subtitleProgram.text = ageText
                                cell.subtitleProgram.textColor = UIColor.darkGray
                            }
                        }
                    }
                }
            }
        default:
            break
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selected = sender as? ProgramTableViewCell,
            let indexPath = programsTableView.indexPath(for: selected),
            let dest = segue.destination as? SupportProgramListViewController {
            let cat = dict.keys.sorted()
            let category = cat[indexPath.row]
            guard let chosen = filteredAgeDict[category] else { return }
            dest.categoryChosen = chosen
        } else if let _ = sender as? GEDTableViewCell,
            let dest = segue.destination as? SupportProgramListViewController {
            dest.gedLocation = self.gedLocations
        }
    }
    
    func animateCells() {
        let allVisibleCells = self.programsTableView.visibleCells
        
        for (index, cell) in allVisibleCells.enumerated() {
            cell.transform = CGAffineTransform(translationX: 100.0, y: 0)
            cell.alpha = 0
            UIView.animate(withDuration: 1.5, delay: 0.2 * Double(index), options: .curveEaseInOut, animations: {
                cell.alpha = 1.0
                cell.transform = .identity
            }, completion: nil)
        }
    }
    
}
