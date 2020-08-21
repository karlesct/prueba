//
//  FirstPresenter.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 20/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import Foundation

internal protocol FirstViewProtocol: class {
    var title: String? { get set }
    func setLoading(_ loading: Bool)
    func isDocumentSelected(selected: Bool)
    func update(with documents: [DocumentModel])
}

internal protocol FirstPresenterProtocol: class {

    var view: FirstViewProtocol? { get set }
    func loadView()
    func didSelectOpenPicker()
    func searchTextDidChange(text: String)
    func didSelectSortByPosition()
    func didSelectSortByAlpabetically()
    func didSelectSortByNumberOfAppearances()

}

internal final class FirstPresenter: FirstPresenterProtocol {

    // MARK: - Properties

    private var picker: DocumentPickerProtocol

    // MARK: - Fields

    weak var view: FirstViewProtocol?

    private var documentsAll: [DocumentModel] = []
    private var documentsFiltered: [DocumentModel] = []

    // MARK: - Init

    init(picker: DocumentPickerProtocol) {
        self.picker = picker
    }

    func loadView() {

        view?.title = "WordCount"

        picker.delegate = self

    }

    func didSelectOpenPicker() {
        picker.openDocumentPicker()
    }

    func searchTextDidChange(text: String) {

        var document: [DocumentModel] = []

        if text.isEmpty {

            document = documentsAll

        } else {

            for var item in documentsFiltered {

                item.words = item.words.filter { $0.word.range(of: text.lowercased()) != nil }
                document.append(item)
            }
        }

        documentsFiltered = document

        view?.update(with: document)
    }

    func didSelectSortByPosition() {

        var document: [DocumentModel] = []

        for var item in documentsFiltered {

            item.words = item.words.sorted(by: {
                guard let first = $0.position else { return true }
                guard let second = $1.position else { return false }

                return first < second
            })
            document.append(item)
        }

        documentsFiltered = document

        view?.update(with: document)

    }

    func didSelectSortByAlpabetically() {

        var document: [DocumentModel] = []

        for var item in documentsFiltered {

            item.words = item.words.sorted(by: { $0.word < $1.word })
            document.append(item)
        }

        documentsFiltered = document

        view?.update(with: document)

    }

    func didSelectSortByNumberOfAppearances() {

        var document: [DocumentModel] = []

        for var item in documentsFiltered {

            item.words = item.words.sorted(by: { $0.count < $1.count })
            document.append(item)
        }

        documentsFiltered = document

        view?.update(with: document)
    }
}

extension FirstPresenter: DocumentPickerDelegate {

    func didPickDocuments(urls: [URL]?) {

        guard let urls = urls else {

            view?.isDocumentSelected(selected: false)

            return
        }

        view?.isDocumentSelected(selected: true)

        let documents = buildDocuments(urls: urls)

        documentsAll = documents
        documentsFiltered = documents

        didSelectSortByPosition()

        view?.update(with: documentsFiltered)

    }

    private func buildDocuments(urls: [URL]) -> [DocumentModel] {

        var documents: [DocumentModel] = []

        for item in urls {

            var filePath = item.absoluteString
            filePath = filePath.replacingOccurrences(of: "file:/", with: "") //making url to file path

            if let string = try? String(contentsOfFile: filePath, encoding: .utf8) {

                let converted = DocumentConverters().convertStringToDocument(name: item.lastPathComponent, body: string)

                documents.append(converted)

            }

        }

        return documents
    }

}
