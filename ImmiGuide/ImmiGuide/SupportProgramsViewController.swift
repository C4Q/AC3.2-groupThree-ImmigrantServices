//
//  SupportProgramsViewController.swift
//  ImmiGuide
//
//  Created by Madushani Lekam Wasam Liyanage on 2/18/17.
//  Copyright © 2017 Madushani Lekam Wasam Liyanage. All rights reserved.
//

import UIKit

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
        APIRequestManager.manager.getData(endPoint: apiEndPoint) { (data) in
            if let validData = data,
                let validPrograms = SupportProgram.getSupportPrograms(from: validData){
                self.programs = validPrograms
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
        
        cell.textLabel?.text = programCatogories[indexPath.row]
        
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
    
}
