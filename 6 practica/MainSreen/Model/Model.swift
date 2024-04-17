//
//  File.swift
//  6 practica
//
//  Created by Nikita Shipovskiy on 16/04/2024.
//

import Foundation




struct Item: Identifiable {
    var id = UUID().uuidString
    var name: String
    var imageBig: String
    var imageLil: [String]
    var desi: String
    
    
    static func makeData() -> [Item] {
        [
            Item(name: "Nikita Shipovskiy", imageBig: "img1.5", imageLil: ["img1","img2"], desi: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt"),
            Item(name: "Nikita Shipovskiy2", imageBig: "img1.1", imageLil: ["img1.2","img1.3"], desi: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt"),
            Item(name: "Nikita Shipovskiy3", imageBig: "img2.1", imageLil: ["img2.2","img2.3"], desi: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt"),
        ]
        
    }
}

