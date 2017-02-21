//
//  TeamDetailCollectionViewCell.swift
//
//
//  Created by Madushani Lekam Wasam Liyanage on 2/20/17.
//
//

import UIKit

class TeamDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    let teamDict = ["Annie Tung":"https://www.linkedin.com/in/tungannie/", "Christopher Chavez": "https://www.linkedin.com/in/cristopher-chavez-6693b965/", "Eashir Arafat":"https://www.linkedin.com/in/eashirarafat/", "Madushani Lekam Wasam Liyanage":"https://www.linkedin.com/in/madushani-lekam-wasam-liyanage-74319bb5/"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBAction func linkedInButtonTapped(_ sender: UIButton) {
       
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    

}
