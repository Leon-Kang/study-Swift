//
//  main.swift
//  swift继承
//
//  Created by 康梁 on 15/9/16.
//  Copyright (c) 2015年 kl. All rights reserved.
//

import Foundation

// 什么叫继承：一个类可以从他的父类或者基类中直接拿过来属性或者方法去使用。
// 父类：父类和子类是一对相对的概念，A类是B类的父类，那么B类是A类的子类。

/*
构造函数
一个对象创建完毕之后，都需要使用构造函数对其进行初始化，也就是OC中的初始化
1、没有func关键字
2、没有返回值

*/
class Person {
    
    var name:String = ""
    
    // 储存属性如果在创建的时候没有赋初始值，那么就需要在每一个构造函数里都对该属性赋值
    var age:Int
    
    // 每个类都有一个默认的构造函数
    init(){
        print("这是一个人的初始化方法")
        self.age = 0
    }
    
    // 自定义的构造函数
    init(name:String,age:Int){
        self.name = name
        self.age = age
        
    }
    
    /*
    析构函数
    作用：一个对象释放资源的方法，就像OC的dealloc方法
    */
    // swift采用的ARC机制
    deinit{
        print("人已经死亡")
    }
    
    
    
//    var name:String = ""
    
    func sleep(){
        print("sleep")
    }
}

// class的关键字
// Man当前类的类名
// :表示继承关系
// :后边的super class是父类
// Man继承自Person这个类

class Man : Person {
  
    // override:重写父类方法的关键字
    // 我们默认的初始化方法会自动的调用父类的初始化方法
    override init(){
        super.init()
        print("这是一个男人的初始化方法")
    }
    
    
    // 如果一个类重写了父类里面的方法，会调用自己类里面的方法，如果我们在子类里面也想使用父类的方法，要使用super来调用父类里面的方法
    override func sleep() {
        super.sleep()
        print("这是一个男人在睡觉")
    }
}


func f(){
    var p2 = Person()
}


//var m = Man()
//m.name = "阿三"
//m.sleep()

var p1 = Person(name: "阿三", age: 88)
print("name = \(p1.name),age = \(p1.age)")

print("***************")

f()

print("^^^^^^^^^^^^^^^")








