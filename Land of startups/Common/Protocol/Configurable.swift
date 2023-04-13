//
//  Configurable.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import Foundation

protocol Configurable {
    associatedtype ViewModel
    
    func configure(with viewModel: ViewModel)
}
