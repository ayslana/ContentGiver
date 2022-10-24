//
//  CardController.swift
//  ContentGiver
//
//  Created by Ayslana Riene on 18/10/22.
//

import Foundation
import UIKit

class CardCellController: UITableViewController {
    private let cardVm = ContentListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        Task {
            await populateContent()
        }
    }
    private func configureUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Top Content"
        tableView.register(CardCell.self, forCellReuseIdentifier: "CardCell")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cardVm.contents.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath)
                as? CardCell else {
            fatalError("Not defined!")
        }
        let content = cardVm.contents[indexPath.row]
        cell.configure(content)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            let urlString = cardVm.contents[indexPath.row].articleUrl ?? ""
            if let urlToGo = URL(string: urlString )
            {
                UIApplication.shared.open(urlToGo)
            }
        }
    private func populateContent() async {
        await cardVm.populateContent(baseUrl: Constants.Urls.getContent)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
        print(cardVm.contents)
    }
}
