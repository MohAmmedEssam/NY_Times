//
//  MainViewCell.swift
//  NY_Times
//
//  Created by Mohammed Essam on 6/15/20.
//  Copyright © 2020 ElhayesGroup. All rights reserved.
//

import UIKit

class MainViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLa: UILabel!
    @IBOutlet weak var descripLa: UILabel!
    @IBOutlet weak var dateLa: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellManagment(_ data:Result){
        titleLa.text = data.title
        descripLa.text = data.byline
        dateLa.text = "🗓 " + (data.publishedDate ?? "")

        if let url = URL(string: data.media?.first?.mediaMetadata?.first?.url ?? ""){
            img.imageFromURL(url)
        }
    }
    
}
