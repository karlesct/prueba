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
}

internal protocol FirstPresenterProtocol: class {
    
    var view: FirstViewProtocol? { get set }
    func loadView()
    func didSelectOpenPicker()
    
}

internal final class FirstPresenter: FirstPresenterProtocol {
    
    
    // MARK: - Properties
    
    private var picker: DocumentPickerProtocol
    
    // MARK: - Fields
    
    weak var view: FirstViewProtocol?
    
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
    
    
}

extension FirstPresenter: DocumentPickerDelegate {
    
    func didPickDocuments(urls: [URL]?) {
        
        guard let urls = urls else {
            
            view?.isDocumentSelected(selected: false)
            
            return
        }
        
        view?.isDocumentSelected(selected: true)
        
        urls.forEach { item in
        
            var filePath = item.absoluteString
            filePath = filePath.replacingOccurrences(of: "file:/", with: "") //making url to file path
            
            if let string = try? String(contentsOfFile: filePath, encoding: .utf8) {
                    
                let converted = DocumentConverters().convertStringToDocument(name: item.lastPathComponent, body: string)
                print(converted)
            }
        
        }
        
    }
    
}



