//
//  EarthImageEntity.swift
//  HomeWork
//
//  Created by Adel Khaziakhmetov on 21.06.2021.
//

import SwiftUI

struct EarthImageEntity: Codable, Identifiable, Hashable {
    var id: String {
        return identifier
    }
    let identifier: String
    let caption: String
    let image: String
    
    var date: String {
        let dateString = String(identifier.prefix(8))
        
        return String(from: Date(from: dateString, with: "yyyyMMdd"), with: "dd MMMM yyyy")
    }
    
    var time: String {
        let dateString = String(identifier.suffix(6))
        
        return String(from: Date(from: dateString, with: "HHmmss"), with: "HH:mm:ss")
    }
}
