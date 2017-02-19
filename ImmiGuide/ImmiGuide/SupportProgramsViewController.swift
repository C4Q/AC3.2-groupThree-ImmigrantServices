//
//  SupportProgramsViewController.swift
//  ImmiGuide
//
//  Created by Madushani Lekam Wasam Liyanage on 2/18/17.
//  Copyright © 2017 Madushani Lekam Wasam Liyanage. All rights reserved.
//

import UIKit
import Lottie
import SnapKit

class SupportProgramsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var contanierView: UIView!
    @IBOutlet weak var supportProgramsTableView: UITableView!
    
    let apiEndPoint = "https://data.cityofnewyork.us/resource/tm2y-4xcp.json"
    //let apiEndPoint = "https://data.cityofnewyork.us/resource/tm2y-4xcp.json?$$app_token=nm76DTR92XyaW6KqlXQewFfXn"
    
    var programs: [SupportProgram] = []
    let programCatogories: [String] = ["Legal Services", SupportProgramType.domesticViolence.rawValue, SupportProgramType.immigrantFamilies.rawValue, SupportProgramType.ndaImmigrants.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        supportProgramsTableView.delegate = self
        supportProgramsTableView.dataSource = self
        supportProgramsTableView.rowHeight = 100.0
        supportProgramsTableView.separatorColor = .clear
        supportProgramsTableView.tableFooterView = UIView()
        
        APIRequestManager.manager.getData(endPoint: apiEndPoint) { (data) in
            if let validData = data,
                let validPrograms = SupportProgram.getSupportPrograms(from: validData){
                self.programs = validPrograms
                
                DispatchQueue.main.async {
                    self.supportProgramsTableView.reloadData()
                    //          self.animateTableView()
                    self.animateCells()
                }
            }
        }
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programCatogories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = supportProgramsTableView.dequeueReusableCell(withIdentifier: "supportPraogramCellIdentifier", for: indexPath) as! SupportProgramTableViewCell
        //        cell.layer.cornerRadius = 25.0
        //        cell.layer.borderWidth = 2.0
        //        cell.layer.borderColor = UIColor.blue.cgColor
        cell.titleLabel.layer.cornerRadius = 25.0
        cell.titleLabel.layer.borderWidth = 2.0
        cell.titleLabel.layer.borderColor = UIColor.blue.cgColor
        let labelName = programCatogories[indexPath.row]
        guard let languageDict = Translation.supportVC["Spanish"] as? [String : String],
            let labelNameInLanguage = languageDict[labelName] else { return cell }
            cell.titleLabel.text = labelNameInLanguage
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "programListSegueIdentifier" {
            if let spltc = segue.destination as? SupportProgramListViewController,
                let cell = sender as? SupportProgramTableViewCell,
                let indexPath = supportProgramsTableView.indexPath(for: cell) {
                switch programCatogories[indexPath.row] {
                case "Legal Services":
                    spltc.programList = programs.filter({ (program) -> Bool in
                        program.program == SupportProgramType.legalServices.rawValue || program.program == SupportProgramType.legalAssistance.rawValue
                    })
                    dump(spltc.programList)
                case SupportProgramType.domesticViolence.rawValue:
                    spltc.programList = programs.filter({ (program) -> Bool in
                        program.program == SupportProgramType.domesticViolence.rawValue
                    })
                case SupportProgramType.immigrantFamilies.rawValue:
                    spltc.programList = programs.filter({ (program) -> Bool in
                        program.program == SupportProgramType.immigrantFamilies.rawValue
                    })
                case SupportProgramType.ndaImmigrants.rawValue:
                    spltc.programList = programs.filter({ (program) -> Bool in
                        program.program == SupportProgramType.ndaImmigrants.rawValue
                    })
                default:
                    break
                }
            }
        }
    }
    
    // MARK: Animation
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 1.5, delay: 0.2 * Double(indexPath.row), options: [], animations: {
            cell.alpha = 1.0
        }, completion: nil)
    }
    
    func animateCells() {
        let allVisibleCells = self.supportProgramsTableView.visibleCells
        
        for (index, cell) in allVisibleCells.enumerated() {
            cell.transform = CGAffineTransform(translationX: 100.0, y: 0)
            cell.alpha = 0
            UIView.animate(withDuration: 1.5, delay: 0.2 * Double(index), options: .curveEaseInOut, animations: {
                cell.alpha = 1.0
                cell.transform = .identity
            }, completion: nil)
        }
    }
    
    func animateFamilyIcon() {
        
        //    circleAnimationView.play()
        //    familyImageView.alpha = 0
        //    UIView.animate(withDuration: 0.4, delay: 0.6, options: .curveEaseIn, animations: {
        //      self.familyImageView.alpha = 1.0
        //    }, completion: nil)
    }
    
    // MARK: Views
    
    
    
    
}
