//
//  ImageFactory.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import UIKit

final class ImageFactory {
    
    static func image(for imageType: ImageType) -> UIImage {
        if case .image(let image) = imageType {
            return image
        }
        return UIImage(named: imageType.rawValue)!
    }
}
