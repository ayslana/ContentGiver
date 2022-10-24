//
//  ContentModel.swift
//  ContentGiver
//
//  Created by Ayslana Riene on 19/10/22.
//

import Foundation

struct ArticleListModel: Codable {
    let articles: [ArticleModel]
    private enum CodingKeys : String, CodingKey {
        case articles
    }
}

struct ArticleModel: Codable {
    let author: String?
    let title: String?
    let description: String?
    let articleUrl: String?
    let image: String?
    enum CodingKeys: String, CodingKey {
        case author
        case title
        case description
        case articleUrl = "url"
        case image = "urlToImage"
    }
}

extension ArticleModel {
    func isValidAuthor() -> Bool {
        return author!.count > 1
    }
}
