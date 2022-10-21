import Foundation


enum footwearTypes: String {
    case sneakers = "Sneakers"
    case slippers = "Slippers"
    case boots = "Boots"
    case highTops = "High-Tops"
}

struct Footwear {
    let brand: String
    let model: String
    let size: Double
    let footwearType: footwearTypes
}

struct Brand {
    let name: String
    let image: String
}

struct Data {
    let brandsList: [Brand]
    let footwearList: [Footwear]
}

struct Database {
    static func getAllFootwear() -> Data {
        Data(brandsList: [
            Brand(name: "Nike", image: "nike"),
            Brand(name: "Adidas", image: "adidas"),
            Brand(name: "Jordan", image: "jordan"),
            Brand(name: "Puma", image: "puma"),
            Brand(name: "Converse", image: "converse")
        ], footwearList: [
            Footwear(brand: "Nike", model: "Air Force 1", size: 43.0, footwearType: .sneakers),
            Footwear(brand: "Jordan", model: "Retro 4", size: 42.0, footwearType: .sneakers),
            Footwear(brand: "Nike", model: "Air Force 1 Boot", size: 43.0, footwearType: .boots),
            Footwear(brand: "Adidas Yeezy", model: "350", size: 42.5, footwearType: .sneakers),
            Footwear(brand: "Jordan", model: "Slides", size: 44.0, footwearType: .slippers),
            Footwear(brand: "Puma", model: "X-Ray", size: 47.0, footwearType: .sneakers),
            Footwear(brand: "Converse", model: "Chuck Taylor", size: 43.5, footwearType: .highTops),
            Footwear(brand: "Nike", model: "Air Max 95", size: 43.0, footwearType: .sneakers),
            Footwear(brand: "Adidas Yeezy", model: "500", size: 42.5, footwearType: .sneakers),
            Footwear(brand: "Jordan", model: "Super Fly", size: 41.0, footwearType: .sneakers),
        ])
    }
}


