//
//  WindomViewController.swift
//  MVVMUseingJsonDecoderOne
//
//  Created by DISHA on 03/03/22.
//

import UIKit

class WindomViewController: UIViewController {

    //MARK: -Outlets of WindomViewController
    @IBOutlet weak var direction: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var directionTimePoint: String = ""
    var speedTimePoint: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        direction.text = directionTimePoint
        speedLabel.text = speedTimePoint
    }

    // MARK: - Navigation
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        navigationToUserData()
    }
    func navigationToUserData(){
        let storyBord: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let windomViewController = storyBord.instantiateViewController(withIdentifier: "UserDataViewController") as! UserDataViewController
        navigationController?.pushViewController(windomViewController, animated: true)
    }
}
