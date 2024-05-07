//
//  File.swift
//  
//
//  Created by Nick Sarno on 4/10/24.
//

import Foundation
import UIKit

struct ImageUploader {
    
    let service: StorageUploaderService
    
    init(config: StorageUploaderServiceOption) {
        self.service = config.service
    }
    
    func saveImage(path: String, image: UIImage, compression: ImageCompressionOption = .jpg(compressionQuality: 1)) async throws -> URL {
        try await service.saveImage(path: path, image: image, compression: compression)
    }
    
    func saveAudio(path: String, localFileUrl: URL) async throws -> URL {
        try await service.saveAudio(path: path, localFileUrl: localFileUrl)
    }
}
