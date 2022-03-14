//
//  ViewController.swift
//  FleurDIciTest
//
//  Created by Mathias Erligmann on 14/03/2022.
//

import UIKit

class FlowerViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    var viewModel: FlowerViewModel?
    
    private let interactor = FlowerInteractor()
    private let router = FlowerRouter()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureTitle()
        configureBackground()
        configureTableView()
    }
    
    // MARK: Setup
    
    func setup() {
        interactor.presenter.viewController = self
        router.viewController = self
    }
    
    // MARK: Configure
    
    private func configureBackground() {
        view.backgroundColor = .white
    }
    
    func configureTitle() {
        title = "Flowers"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        tableView.register(FlowerTableViewCell.self, forCellReuseIdentifier: FlowerTableViewCell.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    }
    
    // MARK: Display
    
    func displayFlowers(viewModel: FlowerViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension FlowerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.flowers.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FlowerTableViewCell.cellIdentifier, for: indexPath) as? FlowerTableViewCell {
            cell.set(flower: viewModel?.flowers[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let flowerName = viewModel?.flowers[indexPath.row].name,
           let url = URL(string: "https://fr.wikipedia.org/wiki/\(flowerName)") {
            router.routeToSafari(url: url)
        } else {
            let alert = UIAlertController(title: "Oops", message: "La page wikipedia n'est pas disponible pour cet item.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
}
