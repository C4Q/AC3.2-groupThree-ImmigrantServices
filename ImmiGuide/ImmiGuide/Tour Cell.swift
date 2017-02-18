//
//  Tour Cell.swift
//  ImmiGuide
//
//  Created by Annie Tung on 2/18/17.
//  Copyright © 2017 Madushani Lekam Wasam Liyanage. All rights reserved.
//

import Foundation
import UIKit

class TourCell: BaseCell {
    
    static let identifier = "PageTourID"
    
    let imageView: UIImageView = {
        let image = UIImage(named: "Tour page wallpaper")
        let im = UIImageView(image: image)
        im.contentMode = .scaleAspectFit
        im.clipsToBounds = true
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    var tour: PageTour? {
        didSet {
            
        }
    }
}
