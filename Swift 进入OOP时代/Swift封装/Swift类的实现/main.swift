//
//  main.swift
//  Swift类的实现
//
//  Created by 康梁 on 15/9/16.
//  Copyright (c) 2015年 kl. All rights reserved.
//

import Foundation
/*
封装
1.属性封装了set和get方法
2.方法里面封装了具体的代码块
3.类封装了属性和方法
4.一个项目封装了好多类的内部实现

*/



// 1. class表示类的关键字
// 2. class后面表示类名
// 3. 从类名的后面的{从开始到结束}，之间表示类的内部
class Person{
    // 属性
    // 在官网上，swift有三种类型的属性 1.储存属性；2.计算属性；3.类属性
    // 在swift中属性和其他的面向对象语言中的成员变量很类似
    var name:String = ""
    
    // 储存属性：主要使用存储一个对象中的常量或者变量（OC实例变量很像）
    // 注意 储存属性必须要赋初始值
    var age:Int = 20
    
    // 延迟储存属性：让某些资源在用到的时候再去加载，避免了一些不必要的资源浪费
    lazy var dog:Dog = Dog()
    
    // 计算属性：不是用来储存属性的值，主要为我们提供属性的get和set方法，我们可以通过重写get和set方法，对属性的值做一些简单地运算。
    // 注意 计算属性不能赋初始值
    // 注意 提供get和set方法
    var english:Int = 0
    var chinese:Int = 0
    var math:Int = 0
    var sum:Int{
        get{
            return english + chinese + math
        }
    }
    
    // 类属性：用class来修饰，只能是计算属性，不能是储存属性，使用类去调用属性
    class var des:String {
        get{
            return "It's a man"
        }
    }
    
    
    // 行为 -> 方法
    func sleep(){
        print("睡觉的一个人")
    }
    
}

class Dog {
    init(){
        print("It's a dog")
    }
}


// p是person类型的一个对象
var p = Person() // 默认的一个构造函数

p.name = "jim"

print(p.name)

// 方法的使用（以点语法形式使用）
p.sleep()


p.english = 90
p.chinese = 10
p.math = 0

print(p.sum)

print(Person.des)








