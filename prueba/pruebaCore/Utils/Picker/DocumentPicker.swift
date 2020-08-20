//
//  DocumentPicker.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 20/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import UIKit
import MobileCoreServices

public protocol DocumentPickerDelegate: class {
    
    func didPickDocuments(urls: [URL]?)
    
}

public class DocumentPicker: NSObject {
    
    // MARK: Fields
    
    private weak var viewController: UIViewController?
    private weak var delegate: DocumentPickerDelegate?
    
    private var types: [String]?
    
    // MARK: - Constructor
    
    public init(viewController: UIViewController,
                types: [String],
                delegate: DocumentPickerDelegate) {
        
        self.viewController = viewController
        self.types = types
        self.delegate = delegate
    }
    
    // MARK: - Accessible methods
    
    public func openDocumentPicker() {
        
        guard let viewController = viewController,
            let types = types else { return }
        
        let documentPickerViewController = UIDocumentPickerViewController(documentTypes: types, in: .import)
        documentPickerViewController.delegate = self
        
        documentPickerViewController.modalPresentationStyle = .fullScreen
        
        if #available(iOS 11.0, *) {
            documentPickerViewController.allowsMultipleSelection = true
        }
        
        viewController.present(documentPickerViewController, animated: true, completion: nil)
        
    }
}

extension DocumentPicker: UIDocumentPickerDelegate {
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        delegate?.didPickDocuments(urls: urls)
    }
    
    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        
        delegate?.didPickDocuments(urls: nil)
        
    }

}
