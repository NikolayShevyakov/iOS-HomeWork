//
//  main.swift
//  1L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 03.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation

//Задание 1. Решить квадратное уравнение.

var a: Double = 7
var b: Double = 0
var c: Double = 5
var D: Double = 0

D = pow(b,2) - 4 * a * c
if (D > 0) {
    print("Два корня:")
    print("x1 = \((-b + sqrt(D)) / (2 * a))")
    print("x2 = \((-b + sqrt(D)) / (2 * a))")
}else if (D == 0){
    print("Один корень:")
    print("x1 = \((-b + sqrt(D)) / (2 * a))")
}else{
    print("В уравнении нет корней")
}

//Задание 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

var a1: Double = 5
var b1: Double = 5
var c1: Double = 0
var S: Double = 0
var P: Double = 0

c1 = sqrt(pow(a1,2) + pow(b1,2))
S = (a1 * b1) / 2
P = a1 + b1 + c1

print("Гипотенуза треугольника =\(Int(c1))")
print("Площадь треугольника =\(Int(S))")
print("Периметр треугольника =\(Int(P))")


//Задание 3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

print("Введите первоначальную сумму вложения:")
let dDepSum = Double(readLine()!)!
print("Введите процентную ставку по депозиту")
let dPercentage = Double(readLine()!)!
print("С капитализацией процентов?(да/нет)")
let yesNoCap = readLine()!

var dDaysInMonth: Double = 30.5
var dDaysInYear: Double = 365
var iYear: Int = 5
var n: Double = 12 * Double(iYear)
var dInput: Double = 0

if yesNoCap == "да"{
    dInput = dDepSum * pow((1 + (((dPercentage/100) * dDaysInMonth)/(dDaysInYear * 1))),n) - dDepSum
}else{
    dInput = (dDepSum * (dPercentage/100) * n * dDaysInMonth)/(dDaysInYear * 1)
}

print("При размещении \(dDepSum) на счёт под \(dPercentage)%,\nпроцентный доход составит \(round(dInput * 100) / 100)руб.")

