//
//  CollectionViewCell.swift
//  ContentGiver
//
//  Created by Ayslana Riene on 23/10/22.
//

import Foundation
import UIKit
import SwiftUI

class CardCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var sideLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func configure(_ content: CardCellViewModel) {
        titleLabel.text = content.title
        subTitleLabel.text = content.description
        sideLabel.text = content.author
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(sideLabel)
        titleLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        subTitleLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        sideLabel.widthAnchor.constraint(equalTo: subTitleLabel.widthAnchor).isActive = true
        sideLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor).isActive = true
        sideLabel.leadingAnchor.constraint(equalTo: subTitleLabel.leadingAnchor).isActive = true
    }
}

struct CardCellRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let cell = CardCell(style: .default, reuseIdentifier: "CardCell")
        cell.configure(CardCellViewModel(content: ArticleModel(author: "Test", title: "Test", description: "Test", articleUrl: "Test", image: "Test")))
        return cell
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct CardCell_Previews: PreviewProvider {
    static var previews: some View {
        CardCellRepresentable()
    }
}
