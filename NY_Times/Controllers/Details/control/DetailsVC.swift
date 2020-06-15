//
//  DetailsVC.swift
//  NY_Times
//
//  Created by Mohammed Essam on 6/15/20.
//  Copyright © 2020 ElhayesGroup. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var titleLa: UILabel!
    @IBOutlet weak var descripLa: UILabel!
    @IBOutlet weak var dateLa: UILabel!

    var data:Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addCollectionDelegates()
        self.handleViewLabels()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.addTitle()
    }
    //MARK:- add title
    func addTitle(){
        self.navigationItem.title = data?.byline
    }
    //MARK:- addCollectionDelegates
    func addCollectionDelegates(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "DetailsCVcell", bundle: nil), forCellWithReuseIdentifier: "DetailsCVcell")
    }
    //MARK:-handleViewLabels
    func handleViewLabels(){
        guard let data = data else {return}
        titleLa.text = data.title
        descripLa.text = "\(data.byline ?? "")\n\n\(data.adxKeywords ?? "")\n\n\(data.abstract ?? "")"
        dateLa.text = "🗓 " + (data.publishedDate ?? "")
    }
}

//MARK:- addCollectionDataSource

extension DetailsVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width : CGFloat = collectionView.frame.width
        let height: CGFloat = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.media?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCVcell", for: indexPath) as! DetailsCVcell
        if let data = self.data?.media?[indexPath.row]{
            cell.cellManagment(data.mediaMetadata?.last)
        }
        return cell
    }
}
