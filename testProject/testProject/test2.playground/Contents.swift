//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let a:Character = "a"

switch a {
    case "a":
    print("maching")
    fallthrough
    case "b", "c":
    print("not maching")
    
default:
    break
}


func sayHello (personName:String) -> String {
    return "sayHello \(personName)"
}

print(sayHello("abc"))

func hello (a:Int, b:String) ->String {
    return "\(a)" + b
}

print(hello(1, b: "ddd"))


func minMax (arr:[Int]) -> (Int, Int) {
    var (min, max) = (arr[0], arr[1])
    for i in arr {
        if i < min {
            min = i
        }
        
        if i > max {
            max = i
        }
        
    }
    return (min, max)
}


let (min, max) = minMax([1,2,3,4,5])
min
max

func saverageSum (varidic:Int...) ->Double{
    var sum = 0
    for index in varidic {
        sum += index
    }
    return (Double)(sum / varidic.count)
}

saverageSum(1, 2, 3)


func add (a:Int, b:Int) ->Int {
    return a + b
}

func subreact (a:Int, b:Int) ->Int {
    return a - b
}

func printOpration (op:(Int, Int) ->Int, a:Int, b:Int) {
    print(op(a, b))
}

printOpration(add, a: 1, b: 2)

let subreact_p = { (a:Int, b:Int) ->Int in return a - b }

subreact_p(1, 2)

func test (a:Int) ->Int{
    func d (c:Int) ->Int{
        var sum = 0
        sum = a + c
        return sum
    }
    return d(a)
}

test(3)

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(value1:String, value2:String) ->Bool {
    return value1 > value2
}

names.sort(backwards)

names.sort(){return $0 < $1}

names.sort(>)


struct Resolution {
    var width = 0
    var height = 0
}

Resolution(width: 3, height: 5)
let someResolution = Resolution()

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

struct square {
    var width: Double = 0
    var heigth: Double = 0
}

struct path {
    var start: Int
    var length: Int
}

struct point {
    var x: Double
    var y: Double
    var z: Double
}


class Shape {
    var numberOfSide: Int = 0
    var name: String
    
    
    init(name: String) {
        self.name = name
    }
    func simpleDirection() -> String {
        return "A shape with \(numberOfSide)"
    }
    
    func simpleDirection(who:String) -> String{
        return " A shape with \(who)"
    }
}

class NameShape {
    var numberOfSide: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSide) sides"
    }
    
}

class Circle: NameShape {
    var radius: Double
    var heigth: Double
    var width: Double
    
    init(name:String, radius: Double, heigth: Double, width: Double) {
        
        self.radius = radius
        self.heigth = heigth
        self.width = width
        
        super.init(name: name)
    }
    
    
    func 🐱() -> Double {
        return M_PI * radius
    }
    
    func 🐶() -> Double {
        return M_PI * pow(radius, 2)
    }
    
    
    override func simpleDescription() -> String {
        return "come"
    }
}


let cir = Circle(name: "a", radius: 2.3, heigth: 3, width: 3)
cir.🐶()
cir.🐱()


class EquilateralTriangle: NameShape {
    var sideLength: Double = 0
    
    init(sideLength: Double, name: String) {
        
        super.init(name: name)
        numberOfSide = 3
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
}

let eq = EquilateralTriangle(sideLength: 2.3, name: "dddd")
eq.perimeter
eq.name
eq.simpleDescription()
eq.perimeter = 9
eq.perimeter






