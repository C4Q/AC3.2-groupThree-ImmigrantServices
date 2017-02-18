//
//  SupportProgramsViewController.swift
//  ImmiGuide
//
//  Created by Madushani Lekam Wasam Liyanage on 2/18/17.
//  Copyright © 2017 Madushani Lekam Wasam Liyanage. All rights reserved.
//

import UIKit

enum SupportPrograms: String {
    
    case domesticViolence = "Domestic Violence Program"
    case legalAssistance = "Legal Assistance Program"
    case immigrantServices = "Immigration Services,Immigrant Support Services"
    case nda = "Immigration Services,Immigrant Support Services,NDA Programs"
    case refugeeAssistance = "Immigrant/Refugee Assistance"
    
}
/*
{
    ":@computed_region_92fq_4b7q": "18",
    ":@computed_region_efsh_h5xi": "17616",
    ":@computed_region_f5dn_yrer": "1",
    ":@computed_region_sbqj_enih": "37",
    ":@computed_region_yeji_bk3q": "2",
    "agency": "New York Legal Assistance Group (NYLAG)",
    "borough_community": "Brooklyn",
    "contact_number": "212.613.5000",
    "grade_level_age_group": "All Ages",
    "location_1": {
        "type": "Point",
        "coordinates": [
        -73.98919274272059,
        40.606424326705934
        ]
    },
*/
class SupportProgramsViewController: UIViewController {
    
    let apiEndPoint = "https://data.cityofnewyork.us/resource/tm2y-4xcp.json?$$app_token=nm76DTR92XyaW6KqlXQewFfXn"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
