//
//  FirstViewController.swift
//  Template
//
//  Created by Mac on 28.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import RxSwift

class FirstViewController: UIViewController {
    private var defaultItemsReferance = DefaultItems.referance
    let bag = DisposeBag()
    private var viewModel = FirstViewModel()
    private lazy var tableView : UITableView = UITableView()
    private lazy var _bucket : UIButton = UIButton()
    private lazy var _countValue : UILabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupTableView()
        self.setupBucketButton()
        self.viewModel.bucketArray.asObservable().map{"\($0.count)"}.bind(to: self._countValue.rx.text).disposed(by: bag)
    }
    func setupTableView(){
        self.tableView = defaultItemsReferance.defTableView(with: AnaCell.self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .singleLine
        self.tableView.frame = CGRect(x: 0, y: 100, width: screenWith, height: screenHeigth - 100)
        self.view.addSubview(self.tableView)
    }
    func setupBucketButton(){
        self._bucket.setBackgroundImage(bucketImage, for: .normal)
        self._bucket.frame = CGRect(x: screenWith - 70, y: 40, width: 50, height: 50)
        self._countValue = defaultItemsReferance.defLabel(withText: "0", andLabelColor: .black)
        self._countValue.frame = CGRect(x: self._bucket.frame.size.width - 30, y: 10, width: 30, height: 30)
        self._bucket.addSubview(self._countValue)
        self._bucket.addTarget(self, action: #selector(bucketButtonTapped), for: .touchUpInside)
        self.view.addSubview(self._bucket)
    }
    @objc func bucketButtonTapped(){
       let bucketVC = BucketVC()
        bucketVC.set(self.viewModel.bucketArray.value)
        bucketVC.viewModel.bucketArray.asObservable().subscribe { (bucketarray) in
            self.viewModel.bucketArray.value = bucketarray.element ?? [Bucket]()
        }.disposed(by: self.bag)
        self.navigationController?.pushViewController(bucketVC, animated: true)
    }
}
extension FirstViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.coffies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AnaCell else {fatalError()}
        cell.setCoffie(self.viewModel.coffies[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detail = CoffieDetailVC()
        detail.viewModel.my_Bucket.asObservable().subscribe(onNext: { (array) in
            array.forEach { (item) in
                self.viewModel.addBucketArray(item)
            }
        }).disposed(by: bag)
        detail.set(self.viewModel.coffies[indexPath.row])
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
}
