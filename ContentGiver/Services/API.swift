//
//  WebService.swift
//  ContentGiver
//
//  Created by Ayslana Riene on 19/10/22.
//

import Foundation

class API {
    func getContents(baseUrl: URL) async throws -> ArticleListModel? {
        do {
            let (data, _) = try await URLSession.shared.data(from: baseUrl)
            return try JSONDecoder().decode(ArticleListModel.self, from: data)
        } catch {
            print(error)
        }
        return nil
    }
    

}
