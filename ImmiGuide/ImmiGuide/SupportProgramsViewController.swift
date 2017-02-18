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
    let programCatogories: [String] = ["Legal Services", SupportProgramType.domesticViolence.rawValue, SupportProgramType.immigratFamilies.rawValue, SupportProgramType.ndaImmigrants.rawValue]
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch <#value#> {
        case <#pattern#>:
            <#code#>
        default:
            <#code#>
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
