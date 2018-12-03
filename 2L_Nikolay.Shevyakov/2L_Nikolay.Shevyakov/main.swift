//
//  main.swift
//  2L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 03.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation

//Задание 1. Написать функцию, которая определяет, четное число или нет.

print("Введите любое целое число")
let someValue = Int(readLine()!)!

func isItEven (_ iValue:Int)->Bool{
    let answ: Bool = iValue%2==0
    return answ
}

isItEven(someValue) == true ? print("Чётное число") : print("Нечётное число")

//Задание 2. Написать функцию, которая определяет, делится ли число без остатка на 3

func isItDivThree (_ iValue:Int)->Bool{
    let answ: Bool = iValue % 3 == 0
    return answ
}
print("Введите любое целое число")
let valueDivThree = Int(readLine()!)!

if isItDivThree(valueDivThree) == true {
    print("Число делится на 3 без остатка")
}else if valueDivThree < 3 && valueDivThree > -3 && valueDivThree != 0{
    print("При делении на 3 остаток = 3")
}else{
    print("При делении на 3 остаток = \(valueDivThree % 3)")
}

//Задание 3. Создать возрастающий массив из 100 чисел.

var myHundredArray = [Int]()
var i: Int = 0

while myHundredArray.count <= 100 {
    myHundredArray.append(i + 1)
    i += 1
}

//Задание 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

myHundredArray.removeAll(where: {$0 % 2 == 0 || $0 % 3 != 0})

print(myHundredArray)

//Задание 5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.

func myFibonacci (_ someArray: [Decimal])->[Decimal]{
    var newArray = someArray
    
    if newArray.count == 0{
        newArray.append(0)
    }else if newArray.count == 1{
        newArray.append(1)
    }else{
        newArray.append(newArray[(newArray.endIndex - 1)] + newArray[(newArray.endIndex - 2)])
    }
    return newArray
}

var arrFibonacci = [Decimal]()

while arrFibonacci.count <= 100{
    arrFibonacci = myFibonacci(arrFibonacci)
}
for (index, element) in arrFibonacci.enumerated(){
    print("\(index+1). \(element)")
}

//Задание 6.
/*
 Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
 a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
 b. Пусть переменная p изначально равна двум — первому простому числу.
 c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
 d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
 e. Повторять шаги c и d, пока возможно.
 */

var p: Int = 2
var arrPrimeNum = [Int]()


func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}

while arrPrimeNum.count <= 100{
    if isPrime(p) {arrPrimeNum.append(p)}
    p += 1
}
print(arrPrimeNum)


