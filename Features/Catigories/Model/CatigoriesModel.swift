//
//  File.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import Foundation

struct Category {
    let name: String
    let icon: String
    let subcategories: [Subcategory]
}
struct Subcategory {
    let name: String
    let image: String
}
