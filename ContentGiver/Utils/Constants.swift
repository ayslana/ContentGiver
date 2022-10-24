//
//  Constants.swift
//  ContentGiver
//
//  Created by Ayslana Riene on 19/10/22.
//

import Foundation

struct Constants {
    struct Urls {
        static let baseUrl = "https://newsapi.org/v2/"
        static let apiKey = "a9f56589e93042f487921ccd944cc3b9"
        static let getContent = URL(string: "\(baseUrl)/top-headlines?country=us&apiKey=\(apiKey)")!
    }
}
