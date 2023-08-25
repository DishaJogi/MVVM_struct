//
//  UserDataViewModel.swift
//  MVVMUseingJsonDecoderOne
//
//  Created by R&W on 04/03/22.
//

import Foundation

protocol UserDataViewModelDelegate: AnyObject{
    func UserDataloaded()
}

final class UserDataViewModel{
    
    var userData: ApiCalling = ApiCalling()
    weak var delegate: UserDataViewModelDelegate?
    init(delegate: UserDataViewModelDelegate? = nil){
        self.delegate = delegate
    }
    var userGetApi: ApiCalling = ApiCalling()
    var arrUserData: [Nation] = []
    
    func getaTheArrayCount() -> Int{
        return arrUserData.count
    }
    
    func getTheArrayIndex(index: Int) -> Nation {
        return arrUserData[index]
    }
    func getUserDataAPi(){
        userData.apiCalling(urlString: "https://datausa.io/api/data?drilldowns=Nation&measures=Population") { data in
            do{
                let responceJSON = try JSONDecoder().decode(UserData.self, from: data)
                self.arrUserData = responceJSON.datas
                print(self.arrUserData)
                self.delegate?.UserDataloaded()
                
            }catch{
                print(error.localizedDescription)
            }
        } failure: { error in
            print(error.localizedDescription)
        }

    }
}
