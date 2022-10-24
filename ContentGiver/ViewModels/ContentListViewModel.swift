//
//  ContentListViewModel.swift
//  ContentGiver
//
//  Created by Ayslana Riene on 23/10/22.
//

import Foundation

class ContentListViewModel {
    private(set) var contents: [CardCellViewModel] = []
    func populateContent(baseUrl: URL) async {
        do {
            let contents = try await API().getContents(baseUrl: baseUrl)
            self.contents = (contents?.articles.map(CardCellViewModel.init) ?? nil)!
        } catch {
            print(error)}
    }
}

struct CardCellViewModel {
    private let content: ArticleModel
    init(content: ArticleModel) {
        self.content = content
    }
    var author: String? {
        content.author
    }
    var title: String? {
        content.title
    }
    var description: String? {
        content.description
    }
    var articleUrl: String? {
        content.articleUrl
    }
    var image: String? {
        content.image
    }
}
