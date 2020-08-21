//
//  FirstViewController.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 20/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import UIKit

internal final class FirstViewController: UIViewController {

    // MARK: - IBoutlets

    @IBOutlet weak var sbSearch: UISearchBar!
    @IBOutlet weak var scFilter: UISegmentedControl!
    @IBOutlet weak var tvTableView: UITableView!

    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var btnOpenDocuments: UIButton!

    // MARK: - Properties

    private let presenter: FirstPresenterProtocol

    private var documents: [DocumentModel] = []

    // MARK: - Init

    init(presenter: FirstPresenterProtocol) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        presenter.view = self

        presenter.loadView()
    }

    // MARK: - Private methods

    private func setupUI() {

        scFilter.setTitle("Position".localized, forSegmentAt: 0)
        scFilter.setTitle("Alfabetically".localized, forSegmentAt: 1)
        scFilter.setTitle("NumberOfAppearances".localized, forSegmentAt: 2)

        btnOpenDocuments.setTitle("ToStartSelectAFile".localized, for: .normal)

        sbSearch.delegate = self

        tvTableView.delegate = self
        tvTableView.dataSource = self
        tvTableView.register(FirstCell.self)

    }

    // MARK: - Actions

    @IBAction func valueChanged(_ sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case 0:
            presenter.didSelectSortByPosition()
        case 1:
            presenter.didSelectSortByAlpabetically()
        case 2:
            presenter.didSelectSortByNumberOfAppearances()
        default:
            break
        }

    }
    @IBAction func openDocumentsAction(_ sender: Any) {

        presenter.didSelectOpenPicker()

    }

}

extension FirstViewController: FirstViewProtocol {

    func setLoading(_ loading: Bool) {

    }

    func isDocumentSelected(selected: Bool) {

        vwContainer.isHidden = selected

    }

    func update(with documents: [DocumentModel]) {

        self.documents = documents
        tvTableView.reloadData()

    }
}

extension FirstViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.searchTextDidChange(text: searchText)
    }

}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return documents.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = documents[section]
        return section.name
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44 //To remove noise warning
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        let section = documents[section]
        return section.words.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(FirstCell.self, for: indexPath)
        let section = documents[indexPath.section]
        let rowInSection = section.words[indexPath.row]
        cell.bind(with: rowInSection)

        return cell
    }

}
