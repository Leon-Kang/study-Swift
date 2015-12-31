//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

let  a = 6

let my_str = "mo ha"

var str_my = "hamo"

var sbc = 3

print(sbc)

print("It's a \(my_str)")

print(" It's a \(str_my)")

var my_s = my_str + str_my

var my_int = [2, 4]

let minValue = my_int.minElement()

let maxValu = my_int.maxElement()

private let my_float = M_PI

let my_ss: String = "abc"

let my_ii: NSNumber = 2

var my_iiv: CGFloat = 23.3




// 元组 tuples
let notfound = (404, "NOT FOUND", "moha")

let (value, message, moha) = notfound

print("The value is \(value)")

print("The message is \(message)")

let my_tuples_value = notfound.0

let my_tuples_message = notfound.1

var vvvv: NSMutableArray = [2, "sss", "sssss"]
vvvv.firstObject
vvvv.hash
vvvv.count

vvvv.addObject("2")

class person {
    var name: String = String()
    var ID: CGFloat = CGFloat()

    var sex = Int?()
    var age = Int!()
}

// 可选值

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print("converted has an integer of \(convertedNumber)")
}
// 绑定
//if let convertedNumber = sameOptional {
//    
//}


// 数组
var array: Array<Int>?
let arraystr: Array<NSString>?

var threeString = [String](count: 4, repeatedValue: "dog")

threeString.count

// test 
let studentInfo = ("name", 1300000, "male")

let (studentNamevalue, studentID, studentMale) = studentInfo

studentNamevalue
studentID
studentMale

let studentName = studentInfo.0
let studentValue = studentInfo.1
let studentmale = studentInfo.2


let optionValue: String = "2015"

let options = Int(optionValue)

let optionStr = String(optionValue)

if let my_value = Int(optionValue) {
    print(my_value)
}

if let my_intvalue:Int = Int(optionValue) {
    print(my_intvalue)
}


let firstArr = [Int](count: 3, repeatedValue: 1)
let secondArr = [Int](count: 4, repeatedValue: 3)

var addArr = firstArr + secondArr

var someDouble = [1, 2, 3]
var shoppingList: [String] = ["eggs", "apple"]

var shoppingList2: Array<String> = ["eggs", "apple"]

print("It's a arry \(shoppingList2)")

shoppingList2 += ["abb"]

shoppingList2[1...2] = ["abb"]
// shoppingList2[2...3] = ["cgg"]
shoppingList2.insert("efff", atIndex: 2)

for item in shoppingList2 {
    print(item)
}


var kdic: Dictionary = ["2":"three", "f":"g"]

var kkkk: [String:String] = kdic

for (key, value) in kdic {
    print("the key \(key) the value \(value)")
}

let aSet:Set<Int>

var result = 0

var i: Int = 1
for ; i <= 100; ++i {
    
    result += i
    print(i)
    print(result)
}

var sum = 1
for me in 1..<7 {
    sum *= me
}


