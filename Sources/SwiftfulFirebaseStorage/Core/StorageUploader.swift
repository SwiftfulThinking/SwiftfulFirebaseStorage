//
//  StorageUploader.swift
//  
//
//  Created by Nick Sarno on 4/10/24.
//

import Foundation
import UIKit

public struct StorageUploader: Sendable {
    
    let service: StorageUploaderService
    
    public init(configuration: StorageUploaderServiceOption) {
        self.service = configuration.service
    }
    
    public func saveImage(path: String, image: UIImage, compression: ImageCompressionOption = .jpg(compressionQuality: 1)) async throws -> URL {
        try await service.saveImage(path: path, image: image, compression: compression)
    }
    
    public func saveAudio(path: String, localFileUrl: URL) async throws -> URL {
        try await service.saveAudio(path: path, localFileUrl: localFileUrl)
    }
}
