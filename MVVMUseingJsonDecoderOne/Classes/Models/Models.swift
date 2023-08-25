//
//  FilesModels.swift
//  MVVMUseingJsonDecoderOne
//
//  Created by DISHA on 02/03/22.
//

import Foundation

struct DataOfSeries: Codable {
    var product: String
    var id: String
    var dataseries: [DataSeries]
    private enum CodingKeys: String, CodingKey {
        case product, dataseries
        case id = "init"
    }
}
struct DataSeries: Codable {
    var timepoint: Double
    var transparency: Double
    var rehthnm: Double
    var windum: Windom
    
    private enum CodingKeys: String, CodingKey {
        case timepoint,transparency
        case rehthnm = "rh2m"
        case windum = "wind10m"
    }
}
struct Windom: Codable{
    var direction: String
    var speed: Int
}
