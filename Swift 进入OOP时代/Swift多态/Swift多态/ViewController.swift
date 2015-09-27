//
//  ViewController.swift
//  Swift多态
//
//  Created by 康梁 on 15/9/16.
//  Copyright (c) 2015年 kl. All rights reserved.
//

import UIKit

/*
父类指针（引用）指向子类的对象
*/

class Person {
    func sleep(){
        print("这是一个人在睡觉")
    }
}

class Man: Person {
    override func sleep() {
        print("这是一个男人在睡觉")
    }
}

class Woman: Person {
    override func sleep() {
        print("这是一个女人在睡觉")
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let p:Person = Person()
        let m:Man = Man()
        let w:Woman = Woman()
        p.sleep()
        m.sleep()
        w.sleep()
        
        // p1在编译的时候是Person类对象
        // 在运行的时候是Man类型
        let p1:Person = Man()
        p1.sleep()
        
        
        let button:UIButton = UIButton()
        button.frame = CGRectMake(0, 20, 50, 40)
        button.tag = 1
        self.view.addSubview(button)
        
        let label:UILabel = UILabel()
        label.frame = CGRectMake(100, 100, 50, 50)
        label.tag = 2
        self.view.addSubview(label)
        
        let v = self.view.viewWithTag(1)
        print(v)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

