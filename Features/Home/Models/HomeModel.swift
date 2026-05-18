//
//  HomeModel.swift
//  Full elcetronics store
//
//  Created by Omar on 17/05/2026.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let electronicsModel = try? JSONDecoder().decode(ElectronicsModel.self, from: jsonData)

import Foundation

// MARK: - ElectronicsModelElement
public struct ElectronicsModelElement: Codable {
    let id: Int?
    let title: String?
    let price: Int?
    let images: [String]?
}




public typealias ElectronicsModel = [ElectronicsModelElement]
