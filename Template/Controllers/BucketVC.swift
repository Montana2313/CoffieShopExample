//
//  BucketVC.swift
//  Template
//
//  Created by Mac on 30.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import RxSwift

class BucketVC: UIViewController {
    let bag = DisposeBag()
    let viewModel = BucketViewModel()
    private lazy var totalLabel : UILabel = UILabel()
    private lazy var total : UILabel = UILabel()
    let defaultItemsReferance = DefaultItems.referance
    private lazy var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupTableView()
        self.setTotal()
        self.setTotalLabel()
        
        self.viewModel.bucketArray.asObservable().subscribe { (_) in
            self.tableView.reloadData()
            self.total.text = "\(self.viewModel.getTotalPrice()) TL"
        }.disposed(by: self.bag)
    }
    func setupTableView(){
         self.tableView = UITableView()
        tableView.register(BucketCell.self, forCellReuseIdentifier: "bucket")
         self.tableView.delegate = self
         self.tableView.dataSource = self
        self.tableView.backgroundColor = .clear
         self.tableView.frame = CGRect(x: 0, y: 40, width: screenWith, height: screenHeigth - 140)
         self.view.addSubview(self.tableView)
     }
    func setTotalLabel(){
          self.totalLabel = defaultItemsReferance.defLabel(withText: "Total : ", andLabelColor: labelColor)
          self.totalLabel.font = UIFont(name: "Helvetica", size: 40.0)
          self.totalLabel.textAlignment = .left
          self.totalLabel.frame = CGRect(x: 20, y: screenHeigth - 100, width: screenWith - 170, height: 40)
          self.view.addSubview(self.totalLabel)
      }
      func setTotal(){
          self.total = defaultItemsReferance.defLabel(withText: "0 TL", andLabelColor: labelColor)
          self.total.font = UIFont(name: "Helvetica", size: 40.0)
          self.total.textAlignment = .right
          self.total.frame = CGRect(x: screenWith - 170, y: screenHeigth - 100, width: 150, height: 40)
          self.view.addSubview(self.total)
      }
    func set(_ buckets : [Bucket]){
        self.viewModel.bucketArray.value = buckets
    }
}
extension BucketVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.viewModel.bucketArray.value.count > 0 {
            return self.viewModel.bucketArray.value.count
        }
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.viewModel.bucketArray.value.count > 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "bucket")  as? BucketCell else {fatalError()}
            cell.setCoffie(self.viewModel.bucketArray.value[indexPath.row])
            cell.backgroundColor  = .clear
            tableView.separatorStyle = .singleLine
            return cell
        }
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.textLabel?.text = "Nothing inside your bucket :)"
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = labelColor
        tableView.separatorStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.viewModel.removeFromArray(indexPath.row)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
