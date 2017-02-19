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
            print(cat)
            let filteredByAgeArr = rwLocations.filter{$0.program == cat}
            filteredAgeDict[cat] = filteredByAgeArr
        }
        
        self.programsTableView.reloadData()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
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
                cell.gedLabel.text = "GED"
            }
        case 1:
            let cat = dict.keys.sorted()
            let category = cat[indexPath.row]
            cell = programsTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
            if let cell = cell as? ProgramTableViewCell {
                DispatchQueue.main.async {
                    cell.nameOfProgram.text = category
                    if  let age = self.dict[category] {
                        cell.subtitleProgram.text = age
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
            let dest = segue.destination as? ProgramDetailsViewController {
            let cat = dict.keys.sorted()
            let category = cat[indexPath.row]
            guard let chosen = filteredAgeDict[category] else { return }
            dest.categoryChosen = chosen
        } else if let _ = sender as? GEDTableViewCell,
            let dest = segue.destination as? ProgramDetailsViewController {
            dest.gedLocation = self.gedLocations
        }
    }
    
    
}
