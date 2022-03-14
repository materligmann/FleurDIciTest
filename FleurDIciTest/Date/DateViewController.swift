//
//  DateViewController.swift
//  FleurDIciTest
//
//  Created by Mathias Erligmann on 14/03/2022.
//

import UIKit

class DateViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    var viewModel: FlowerViewModel?
    
    private let router = DateRouter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureBackground()
        configureTitle()
        configureTableView()
    }
    
    // MARK: Setup
    
    private func setup() {
        router.viewController = self
    }
    
    // MARK: Configure
    
    private func configureBackground() {
        view.backgroundColor = .white
    }
    
    private func configureTitle() {
        title = "Saisons"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.register(FlowerTableViewCell.self, forCellReuseIdentifier: FlowerTableViewCell.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
    }
}

extension DateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Month.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = Month.allCases[indexPath.row].rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let month = Month(rawValue: Month.allCases[indexPath.row].rawValue),
           let flowers = viewModel?.dates[month] {
            router.routeToFlowerViewController(viewModel: FlowerViewModel(flowers: flowers))
        }
    }
}
