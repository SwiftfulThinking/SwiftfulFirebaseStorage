//
//  ImageUploaderService.swift
//  AIChatTest2
//
//  Created by Nick Sarno on 3/23/24.
//

import Foundation
import UIKit

protocol ImageUploaderService {
    func saveImage(path: String, image: UIImage, compression: ImageCompressionOption) async throws -> URL
}

enum ImageUploaderServiceOption {
    case mock, firebase
    
    var service: ImageUploaderService {
        switch self {
        case .mock:
            return MockImageUploaderService()
        case .firebase:
            return FirebaseImageUploaderService()
        }
    }
}
