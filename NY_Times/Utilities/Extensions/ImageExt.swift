//
//  ImageExt.swift
//  NY_Times
//
//  Created by Mohammed Essam on 6/15/20.
//  Copyright © 2020 ElhayesGroup. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
func imageFromURL(_ url: URL?) {
    if let uRl = url
    {
        DispatchQueue.global().async {
            if let data = try? Data( contentsOf:uRl)
            {
                DispatchQueue.main.async {
                    self.image = UIImage( data:data)
                }
            }
        }
    }
}
}
