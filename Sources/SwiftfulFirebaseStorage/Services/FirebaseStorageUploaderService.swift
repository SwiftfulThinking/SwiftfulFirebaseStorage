//
//  FirebaseStorageUploaderService.swift
//  AIChatTest2
//
//  Created by Nick Sarno on 3/23/24.
//

import Foundation
import FirebaseStorage
import UIKit

struct FirebaseStorageUploaderService: StorageUploaderService {
            
    func saveImage(path: String, image: UIImage, compression: ImageCompressionOption) async throws -> URL {
        guard let data = compression.compress(image: image) else {
            throw FirebaseStorageError.unableToConvertToData
        }
        
        let ref = referenceForPath(path: path, ext: compression.ext)
        return try await save(data: data, reference: ref, meta: compression.meta)
    }
    
    func saveAudio(path: String, localFileUrl: URL) async throws -> URL {
        let audioData = try Data(contentsOf: localFileUrl)
        let ref = referenceForPath(path: path, ext: localFileUrl.pathExtension)
        let meta = StorageMetadata()
        meta.contentType = "audio/\(localFileUrl.pathExtension)"
        return try await save(data: audioData, reference: ref, meta: meta)
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
