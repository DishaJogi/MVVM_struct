//
//  UserDataViewController.swift
//  MVVMUseingJsonDecoderOne
//
//  Created by R&W on 04/03/22.
//

import UIKit

class UserDataViewController: UIViewController {

    @IBOutlet weak var userdataTableView: UITableView!
    
    var userDataModel: UserDataViewModel = UserDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userdataTableView.delegate = self
        userdataTableView.dataSource = self
        userdataTableView.register(UINib(nibName: "UserDataTableViewCell", bundle: nil), forCellReuseIdentifier: "UserDataTableViewCell")
        userDataModel.delegate = self
        userDataModel.getUserDataAPi()
    }
    
}
extension UserDataViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userDataModel.getaTheArrayCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataTableViewCell", for: indexPath) as! UserDataTableViewCell
        let userCell: Nation = userDataModel.getTheArrayIndex(index: indexPath.row)
        cell.idLabel.text = userCell.id
        cell.yearLabel.text = userCell.year
        cell.saugNationLabel.text = userCell.slagNation
        return cell
    }
    
    
}
extension UserDataViewController: UserDataViewModelDelegate{
    func UserDataloaded() {
        DispatchQueue.main.async {
            print("loaded")
           self.userdataTableView.reloadData()
        }
    }
}
