//
//  StorageUploaderService.swift
//  AIChatTest2
//
//  Created by Nick Sarno on 3/23/24.
//

import Foundation
import UIKit

protocol StorageUploaderService {
    func saveImage(path: String, image: UIImage, compression: ImageCompressionOption) async throws -> URL
    func saveAudio(path: String, localFileUrl: URL) async throws -> URL
}

enum StorageUploaderServiceOption {
    case mock, firebase
    
    var service: StorageUploaderService {
        switch self {
        case .mock:
            return MockStorageUploaderService()
        case .firebase:
            return FirebaseStorageUploaderService()
        }
    }
}
