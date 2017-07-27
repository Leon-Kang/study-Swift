enum TextAlignment: Int {
    case left = 20
    case right = 30
    case center = 40
    case justify = 50
}

var alignment: TextAlignment = TextAlignment.left
alignment = .right

let myRawValue = 20
if let myAlignment = TextAlignment(rawValue: myRawValue) {
    print("successfully")
} else {
    print("failed")
}

enum ProgrammingLanguage: String {
    case swift
    case objectiveC = "objective-c"
    case c = "c"
    case cpp = "c++"
    case java = "java"
}
let myFavoriteLanguage = ProgrammingLanguage.swift
print(myFavoriteLanguage.rawValue)

enum Lightbulb {
    case on
    case off
    
    func surfaceTemperaturee(forAmbientTemperatrue ambient: Double) -> Double {
        switch self {
        case .on:
            return ambient + 150.0
        case .off:
            return ambient
        }
    }
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}
var bulb = Lightbulb.on
let ambientTemperrature = 77.0
var bulbTemperature = bulb.surfaceTemperaturee(forAmbientTemperatrue: ambientTemperrature)
print(bulbTemperature)
bulb.toggle()
bulbTemperature = bulb.surfaceTemperaturee(forAmbientTemperatrue: ambientTemperrature)
print(ambientTemperrature)

enum ShapeDimensions {
    case point
    case square(side: Double)
    case rectangle(width: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return side * side
        case let .rectangle(width: w, height: h):
            return w * h
        }
    }
}


enum FamilyTree {
    case noKnownParents
    indirect case oneKnownParent(name: String, ancestors: FamilyTree)
    indirect case twoKnownParents(fatherName: String, fatherAncestors: FamilyTree,
                                  motherName: String, motherAncestors: FamilyTree)
}
let fredAncestors = FamilyTree.twoKnownParents(fatherName: "Fred Sr",
                                               fatherAncestors: .oneKnownParent(name: "Beth", ancestors: .noKnownParents),
                                               motherName: "Marsha",
                                               motherAncestors: .noKnownParents)