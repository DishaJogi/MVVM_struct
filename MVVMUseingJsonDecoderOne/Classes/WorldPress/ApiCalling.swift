//
//  ApiCalling.swift
//  MVVMUseingJsonDecoderOne
//
//  Created by DISHA on 02/03/22.
//

import Foundation

class ApiCalling {
    //MARK: - Api Calling With Useing JsonDecoder
    func apiCalling(urlString: String,
                    success:@escaping (Data) -> Void,
                    failure:@escaping (Error) -> Void) {
    //MARK: -Create a request response data
        let request = URLRequest(url: URL(string: urlString)!)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
    //MARK: -Decode data from json
            do {
                success(data!)
            } catch {
                failure(error.localizedDescription as! Error)
            }
            
        })
        task.resume()
    }
}
