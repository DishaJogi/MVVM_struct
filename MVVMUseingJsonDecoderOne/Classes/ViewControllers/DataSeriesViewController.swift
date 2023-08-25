//
//  ViewController.swift
//  MVVMUseingJsonDecoderOne
//
//  Created by DISHA on 02/03/22.
//

import UIKit

class DataSeriesViewController: UIViewController {
    //MARK: -Table View's Outlet
    @IBOutlet weak var dataSericesTableView: UITableView!
    //MARK: -Variable to access the MAthod Of ViewModelAPI
    var viewModel: ViewModelsApi = ViewModelsApi()
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSericesTableView.delegate = self
        dataSericesTableView.dataSource = self
        dataSericesTableView.register(UINib(nibName: "DataSeriesTableViewCell", bundle: nil), forCellReuseIdentifier: "DataSeriesTableViewCell")
        viewModel.delegate = self
        viewModel.getAPIcalls()
    }
    //MARK: -Navigate To next ViewController
    func navigateToNextPage(index: Int){
        let storyBord: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontroller = storyBord.instantiateViewController(withIdentifier: "WindomViewController") as! WindomViewController
        viewcontroller.directionTimePoint = viewModel.getIndexOfArray(index: index).windum.direction
        viewcontroller.speedTimePoint = String(viewModel.getIndexOfArray(index: index).windum.speed)
        navigationController?.pushViewController(viewcontroller, animated: true)
        
    }

}
//MARK: -Table View's Delegate and DataSource Mathod
extension DataSeriesViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getArrayCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataSeriesTableViewCell", for: indexPath) as! DataSeriesTableViewCell
        let dataSecriesCell: DataSeries = viewModel.getIndexOfArray(index: indexPath.row)
        cell.timePointLable.text = "TimePoint   \(String(Double(dataSecriesCell.timepoint)))"
        cell.transparancyLable.text = "Temparancy   \(String(Double(dataSecriesCell.transparency)))"
        cell.rythemLable.text = "Rythem   \(String(Double(dataSecriesCell.rehthnm)))"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToNextPage(index: indexPath.row)
    }
}
//MARK: -Access Protocol's Mathod From ViewModelAPI
extension DataSeriesViewController: ViewModelsApiDelegate{
    func loaded() {
        DispatchQueue.main.async {
            print("loaded")
           self.dataSericesTableView.reloadData()
        }
    }
}
