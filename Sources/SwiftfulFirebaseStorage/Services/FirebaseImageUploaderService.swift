//
//  FirebaseImageUploaderService.swift
//  AIChatTest2
//
//  Created by Nick Sarno on 3/23/24.
//

import Foundation
import FirebaseStorage
import UIKit

struct FirebaseImageUploaderService: ImageUploaderService {
            
    func saveImage(path: String, image: UIImage, compression: ImageCompressionOption) async throws -> URL {
        guard let data = compression.compress(image: image) else {
            throw FirebaseStorageError.unableToConvertToData
        }
        
        let ref = referenceForPath(path: path, ext: compression.ext)
        return try await save(data: data, reference: ref, meta: compression.meta)
    }
    
    // Add video uploader
    
    // MARK: PRIVATE
    
    private func referenceForPath(path: String, ext: String) -> StorageReference {
        let path = "\(path).\(ext)"
        return Storage.storage().reference(withPath: path)
    }
    
    private func save(data: Data, reference: StorageReference, meta: StorageMetadata) async throws -> URL {
        let _ = try await reference.putDataAsync(data, metadata: meta)
        return try await reference.downloadURL()
    }
    
    enum FirebaseStorageError: Error {
        case unableToFindUrl, unableToConvertToData
    }

}
