//: Playground - noun: a place where people can play

import Cocoa

let registrationResult = (true,"慕课","女")
let connectionResult = (404,"Not Found")

// 以registrationResult为例
// 起名
let ( isRegisterSuccess , nickname , gender ) = registrationResult
// 调用
//  使用名称
isRegisterSuccess
nickname
gender
//  或者直接调用
registrationResult.0
registrationResult.1
registrationResult.2

// 或者直接在定义是就命名一个别名
//let registrationResult = (isRegisterSuccess:true,nickname:"慕课",gender:"女")

// 使用下划线（_）忽略部分数值
let loginResult:(Bool , String) = (true , "慕课")
let ( isLoginSuccess , _ ) = loginResult
if isLoginSuccess
{
    println("登陆成功")
}