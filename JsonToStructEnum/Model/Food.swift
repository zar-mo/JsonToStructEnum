//
//  Food.swift
//  JsonToStructEnum
//
//  Created by Abouzar Moradian on 9/17/24.
//

import Foundation


enum ToppingType: String, Codable{
    case glazed = "Glazed"
    case sugar = "Sugar"
    case powderedSugar = "Powdered Sugar"
    case chocolateSprinkles = "Chocolate with Sprinkles"
    case chocolate = "Chocolate"
    case Maple = "Maple"
    case none = "None"
}

enum CookieType: String, Codable{
    case donut = "donut"
}

enum BatterType: String, Codable {
    case regular = "Regular"
    case chocolate = "Chocolate"
    case blueberry = "Blueberry"
    case devilFood = "Devil's Food"
    
}

struct Topping: Codable{
    let id: String
    let type: ToppingType
}

struct Batter: Codable {
    let id: String
    let type: BatterType
}

struct Batthers: Codable {
    let batter : [Batter]
}

struct Cookie: Codable{
    let id: String
    let type: CookieType
    let name: String
    let ppu: Double
    let batters: Batthers
    let topping: [Topping]
}



