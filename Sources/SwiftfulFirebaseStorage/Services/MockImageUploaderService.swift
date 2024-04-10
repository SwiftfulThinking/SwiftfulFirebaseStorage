//
//  MockImageUploaderService.swift
//  AIChatTest2
//
//  Created by Nick Sarno on 3/23/24.
//

import Foundation
import UIKit

struct MockImageUploaderService: ImageUploaderService {
    
    func saveImage(path: String, image: UIImage, compression: ImageCompressionOption) async throws -> URL {
        try await Task.sleep(nanoseconds: 2_000_000_000)
        return URL(string: "https://picsum.photos/600/600")!
    }
    
}
