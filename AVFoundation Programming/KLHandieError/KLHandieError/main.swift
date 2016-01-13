//
//  main.swift
//  KLHandieError
//
//  Created by 康梁 on 16/1/13.
//  Copyright © 2016年 康梁. All rights reserved.
//

import Foundation

enum NotHuman:ErrorType {
    case LessThanZero
    case MoreThanHuman
}

func inValidAge(age:Int) throws -> String {
    if age < 0 {
        throw NotHuman.LessThanZero
    }
    if age > 150 {
        throw NotHuman.MoreThanHuman
    }
    return "Human"
}

// try! inValidAge(2)

do {
    let type = try inValidAge(-1)
    print("valide age is \(type)")
} catch {
    print(NotHuman.LessThanZero)
}


let type = try? inValidAge(-1)
print(type)

var someType: String?

do {
    someType = try inValidAge(-2)
} catch {
    someType = nil
}












