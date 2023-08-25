//
//  ViewModelsApi.swift
//  MVVMUseingJsonDecoderOne
//
//  Created by DISHA on 02/03/22.
//

import Foundation

//MARK: -ViewModels Delegate for data passing to ViewController
protocol ViewModelsApiDelegate: AnyObject {
    func loaded()
}

final class ViewModelsApi {
    //MARK: -array of dataseries it's for cell mathod
    var arrDataseries: [DataSeries] = []
    //MARK: -apiCalling delegate varible to aceess the Api calls func.
    var delegateTwo: ApiCalling = ApiCalling()
    //MARK: -Varible For acess ViewModels propertie to View Controller
    weak var delegate: ViewModelsApiDelegate?
    init(delegate: ViewModelsApiDelegate? = nil) {
        self.delegate = delegate
    }
    //MARK: -Get array's count for DataSericescell
    func getArrayCount() -> Int{
       return arrDataseries.count
    }
    //MARK: -Get array's indexpath for DataSericesCell
    func getIndexOfArray(index: Int) -> DataSeries{
        return arrDataseries[index]
    }
    //MARK: -func to call The mathod of Apicalls
    func getAPIcalls(){
        delegateTwo.apiCalling(urlString: "https://www.7timer.info/bin/astro.php?lon=113.2&lat=.1&ac=0&unit=metric&output=json&tzshift=0") { data in
            do{
                let jsonResponse = try JSONDecoder().decode(DataOfSeries.self, from: data)
                self.arrDataseries = jsonResponse.dataseries
                print(self.arrDataseries)
                self.delegate?.loaded()
            }catch{
                print(error.localizedDescription)
            }
        } failure: { error in
            print(error.localizedDescription)
        }
    }
}
