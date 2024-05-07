//
//  MockImageUploaderService.swift
//  AIChatTest2
//
//  Created by Nick Sarno on 3/23/24.
//

import Foundation
import UIKit

struct MockStorageUploaderService: StorageUploaderService {
    
    func saveImage(path: String, image: UIImage, compression: ImageCompressionOption) async throws -> URL {
        try await Task.sleep(nanoseconds: 2_000_000_000)
        return URL(string: "https://picsum.photos/600/600")!
    }
    
    func saveAudio(path: String, localFileUrl: URL) async throws -> URL {
        try await Task.sleep(nanoseconds: 2_000_000_000)
        return URL(string: "https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3")!
    }
}
