//
//  MovieResultModel.swift
//  TrCellProject
//
//  Created by Mert Ejder on 9.05.2021.
//

import Foundation

struct MovieResultModel: Codable {
    let page: Int
    let results: [Movie]
}
