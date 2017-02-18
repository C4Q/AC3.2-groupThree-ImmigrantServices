//
//  ProgramsViewController.swift
//  ImmiGuide
//
//  Created by Cris on 2/18/17.
//  Copyright © 2017 Madushani Lekam Wasam Liyanage. All rights reserved.
//

import UIKit

private let cellID = "cellID"

class ProgramsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var programsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        programsTableView.delegate = self
        programsTableView.dataSource = self

        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = programsTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ProgramTableViewCell
        
        return cell

    }


   
}
