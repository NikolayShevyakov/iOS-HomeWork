//
//  main.swift
//  6L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 07.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример:
 filter для массивов)
 3. *Добавить свой subscript, который будет возвращать nil в случае обращения к
 несуществующему индексу.
 */


var wareHouse = Queue<WareHouse>()

//Заполняем склад коробками
for var i in 1...10{
    wareHouse.push(WareHouse())
    i += 1
}

//Считаем кол-во коробок на складе
print("Посылок на складе: \(wareHouse.count())")

//Отоброжаем эти коробки
print(wareHouse)

//Выдаем одну посылку клиенту
print("Отправили посылку - \(wareHouse.pop())")

//Проверка через Subscripting на несуществующий элемент
for element in 0...10{
    wareHouse[element] == nil ? print("Элемент не существует"):print(wareHouse[element]!)
}

//Отфильтруем все коробки ширина которых меньше 10

let filteredWareHouse = wareHouse.filter(array: wareHouse.elements) { (i1: WareHouse) -> Bool in
    return i1.width < 10
}

print(filteredWareHouse)
