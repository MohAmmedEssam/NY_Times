//
//  DetailsCVcell.swift
//  NY_Times
//
//  Created by Mohammed Essam on 6/15/20.
//  Copyright © 2020 ElhayesGroup. All rights reserved.
//

import UIKit

class DetailsCVcell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func cellManagment(_ data:MediaMetadatum?){
        if let url = URL(string: data?.url ?? ""){
            img.imageFromURL(url)
        }
    }
}
