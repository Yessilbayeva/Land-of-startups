//
//  ImageType.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import UIKit

enum ImageType {
    
    // MARK: - TabBar
    
    case home
    case profile
    case services
    case vacancies
    
    // MARK: - Public Properties
    
    case image(image: UIImage)
    case link(url: URL)
    case empty
    
    var rawValue: String {
        switch self {
        case .home:
            return "home"
        case .profile:
            return "profile"
        case .vacancies:
            return "vacancies"
        case .services:
            return "services"
        case .image:
            return ""
        case .link:
            return ""
        case .empty:
            return ""
        }
    }
}
