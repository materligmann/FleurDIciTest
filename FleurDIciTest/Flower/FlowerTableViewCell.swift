//
//  HabituesTableViewCell.swift
//  LesHabituesTest
//
//  Created by Mathias Erligmann on 10/03/2022.
//

import UIKit

class FlowerTableViewCell: UITableViewCell {
    
    private let nameLabel = UILabel()
    private let monthsLabel = UILabel()
    private let iconView = UIImageView()
    
    class var cellIdentifier: String {
        return "FlowerTableViewCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureIconView()
        configureNameLabel()
        configureMonthLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    
    private func configureIconView() {
        iconView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconView)
        iconView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        iconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    private func configureNameLabel() {
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32).isActive = true
        nameLabel.topAnchor.constraint(equalTo: iconView.topAnchor, constant: 0).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func configureMonthLabel() {
        monthsLabel.numberOfLines = 0
        monthsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(monthsLabel)
        monthsLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8).isActive = true
        monthsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32).isActive = true
        monthsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        monthsLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    func set(flower: Flower?) {
        nameLabel.text = flower?.name
        monthsLabel.text = flower?.months
        if let image = flower?.picture {
            iconView.image = UIImage(named: image)
        }
    }
}
