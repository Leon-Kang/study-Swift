//
//  main.swift
//  test
//
//  Created by 康梁 on 15/9/17.
//  Copyright © 2015年 kl. All rights reserved.
//

import Foundation

print("Hello, World!")

var optionals_A:Int?

if optionals_A != nil
{
    print(" not nil!")
}
else
{
    print(" nil! ")
}

var optionals_B:Int? = 11
print(optionals_B)
var op_C = optionals_B?.toIntMax()
print(op_C)