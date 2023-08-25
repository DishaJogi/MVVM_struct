//
//  UserDataModel.swift
//  MVVMUseingJsonDecoderOne
//
//  Created by R&W on 04/03/22.
//

import Foundation

struct UserData: Codable{
    var datas: [Nation]
    
    private enum CodingKeys: String, CodingKey {
        case datas = "data"
    }
}
struct Nation: Codable{
    var id: String
    var year: String
    var slagNation: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "Nation"
        case year = "Year"
        case slagNation = "Slug Nation"
    }
}
