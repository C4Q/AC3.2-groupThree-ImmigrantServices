//
//  SupportProgramsViewController.swift
//  ImmiGuide
//
//  Created by Madushani Lekam Wasam Liyanage on 2/18/17.
//  Copyright © 2017 Madushani Lekam Wasam Liyanage. All rights reserved.
//

import UIKit

class SupportProgramsViewController: UIViewController {
    
    let apiEndPoint = "https://data.cityofnewyork.us/resource/tm2y-4xcp.json"
    //let apiEndPoint = "https://data.cityofnewyork.us/resource/tm2y-4xcp.json?$$app_token=nm76DTR92XyaW6KqlXQewFfXn"
    
    var programs: [SupportProgram] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIRequestManager.manager.getData(endPoint: apiEndPoint) { (data) in
            
            dump(data)
            if let validData = data,
                let validPrograms = SupportProgram.getSupportPrograms(from: validData){
                self.programs = validPrograms
               dump(self.programs)
            }
  
            
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
