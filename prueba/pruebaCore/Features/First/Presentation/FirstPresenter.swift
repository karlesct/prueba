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

        //        var filtered = text.isEmpty
        //            ? documentsAll
        //            : documentsAll.filter{$0.words[0].word.range(of: text.lowercased()) != nil}

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

    func didSelectSortByAlpabetically() {

        //        let sorted = documentsFiltered.sorted(by: { $0.words[0].word < $1.words[0].word })
        //        view?.update(with: sorted)

        var document: [DocumentModel] = []

        for var item in documentsFiltered {

            item.words = item.words.sorted(by: { $0.word < $1.word })//.filter{ $0.word.range(of: text.lowercased()) != nil }
            document.append(item)
        }

        documentsFiltered = document

        view?.update(with: document)

    }

    func didSelectSortByNumberOfAppearances() {

        //        let sorted = documentsFiltered.sorted(by: { $0.words[0].count < $1.words[0].count })
        //        view?.update(with: sorted)
        var document: [DocumentModel] = []

        for var item in documentsFiltered {

            item.words = item.words.sorted(by: { $0.count < $1.count })//.filter{ $0.word.range(of: text.lowercased()) != nil }
            document.append(item)
        }

        documentsFiltered = document

        view?.update(with: document)
    }
}

//protocol OptionalType {
//    associatedtype Wrapped
//    func toOptional() -> Wrapped?
//}
//extension Optional : OptionalType {
//    func toOptional() -> Wrapped? {
//        return self
//    }
//}
//
//extension Sequence where Iterator.Element: OptionalType {
//    func unwrappedElements() -> [Iterator.Element.Wrapped] {
//        return compactMap({ $0.toOptional() })
//    }
//    func filteredElements() -> [Iterator.Element] {
//        return filter({ $0.toOptional() != nil })
//    }
//}
//
//extension Dictionary where Value: OptionalType {
//    func unwrappedValues() -> [Key: Value.Wrapped] {
//        return filter({ $0.value.toOptional() != nil })
//           .mapValues({ $0.toOptional()! })
//    }
//}

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
