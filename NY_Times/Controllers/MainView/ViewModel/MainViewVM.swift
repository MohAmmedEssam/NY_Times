//
//  MainViewVM.swift
//  NY_Times
//
//  Created by Mohammed Essam on 6/15/20.
//  Copyright © 2020 ElhayesGroup. All rights reserved.
//

import Foundation

class MainViewVM {
//    https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=CqM7B7cpRU6GtV2iI8mMD1Y8885RCkQ4
    
    var data:MostPopularResponse?
    
    func getMostPopular(completion: @escaping ()->()) {
        ApiClient(with: ApiConfig()).request(method: .get,
                                        type: .formEncoded,
                                        endpoint: .mostPopular,
                                        query: ["api-key":"CqM7B7cpRU6GtV2iI8mMD1Y8885RCkQ4"],
                                        authenticated: false) { (response:MostPopularResponse?,error ,code) in
                            guard error == nil else{return}
                                            
                            guard code == 200 else{return}
                            
                            guard let res = response else{return}
                            self.data = res
                            completion()
                            
        }
    }
}
