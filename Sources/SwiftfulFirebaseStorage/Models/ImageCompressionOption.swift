//
//  ImageCompressionOption.swift
//  
//
//  Created by Nick Sarno on 4/10/24.
//

import Foundation
import UIKit
import FirebaseStorage

enum ImageCompressionOption {
    case png, jpg(compressionQuality: CGFloat)
    
    func compress(image: UIImage) -> Data? {
        switch self {
        case .png:
            return image.pngData()
        case .jpg(let compressionQuality):
            return image.jpegData(compressionQuality: compressionQuality)
        }
    }
    
    var contentType: String {
        switch self {
        case .png:
            return "image/png"
        case .jpg:
            return "image/jpeg"
        }
    }
    
    var ext: String {
        switch self {
        case .png:
            return "png"
        case .jpg:
            return "jpg"
        }
    }
    
    var meta: StorageMetadata {
        switch self {
        case .png:
            let meta = StorageMetadata()
            meta.contentType = "image/png"
            return meta
        case .jpg:
            let meta = StorageMetadata()
            meta.contentType = "image/jpeg"
            return meta
        }
    }
}
