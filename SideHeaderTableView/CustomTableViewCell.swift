//
//  CustomTableViewCell.swift
//  SideHeaderTableView
//
//  Created by admin on 1/14/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private var hasImage: Bool = false {
        
        didSet {
            self.hasImage ? self.showImage() : self.hideImage()
        }
        
    }
    
    private var imagePlaceholder : UIImage {
           UIImage.add // Any empty Image with same size
    }
    
    func bind(title: String, image: UIImage?) {
        
        self.textLabel?.text = title
        self.imageView?.image = image ?? imagePlaceholder
        self.hasImage = image != nil
        
    }
    
    func hideImage() {
        self.imageView?.isHidden = true
    }
    
    func showImage() {
        
        if hasImage {
        
            self.imageView?.isHidden = false
            
        }
        
    }
    
}

