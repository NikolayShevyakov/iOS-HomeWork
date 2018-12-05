//
//  main.swift
//  5L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 05.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//
/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия. +
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести сами объекты в консоль.
 */
import Foundation
print("\n========================Авто типа легковая машина========================\n")
//Создаем легковые машины
var sportCarOne = SportCar(brandCar: "Bugatti", maxSpeed: 415, engineCapacity: 6.3, leatherInterior: true, engineStatus: .stop, doorState: .close, carRoof: .noHatch, spoiler: .autoSpoiler, carSpeed: 0)

var sportCarTwo = SportCar(brandCar: "BMW", maxSpeed: 250, engineCapacity: 4.4, leatherInterior: true, engineStatus: .stop, doorState: .close, carRoof: .panoramic, spoiler: .fixSpoiler, carSpeed: 0)

print(sportCarOne.description) //Только я не понял чем это лучше, чем функция getInfo, описание все равно нужно через rawValue выводить, или может я неправильно понял функционал данного протокола?

sportCarOne.openDoors()   //Открываем двери и садимся в машину

sportCarOne.closeDoors()  //Закрываем двери за собой дверь

sportCarOne.startEngine() //Запускаем двигатель

print("============Начинаем движение============")

//Набираем скорость
sportCarOne.carSpeedUp(haveSpeed: 100)

//Снижаем скорость
sportCarOne.carSpeedDown(haveSpeed: 10)

//Набираем максимальную скорость
sportCarOne.carSpeedUp(haveSpeed: sportCarOne.maxSpeed)

//пробуем пройти допустимый порог скорости
print("В документации написано, что макс. скорость \(sportCarOne.maxSpeed). Проверим так ли это!")
sportCarOne.carSpeedUp(haveSpeed: 500)

print("\n========================Авто типа грузовик========================\n")
//Создаем грузовые машины

var tunkCarOne = TunkCar(brandCar: "Volvo", maxTrunkCapacity: 25000, engineCapacity: 6.0, engineStatus: .stop, doorState: .close, trunkCapacity: 0, carTrunk: .carTrailer)

var tunkCarTwo = TunkCar(brandCar: "MAN", maxTrunkCapacity: 15000, engineCapacity: 6.0, engineStatus: .stop, doorState: .close, trunkCapacity: 0, carTrunk: .carTunk)

print(tunkCarOne.description)

tunkCarOne.openDoors()   //Открываем двери и садимся в машину

tunkCarOne.closeDoors()  //Закрываем двери за собой дверь

tunkCarOne.startEngine() //Запускаем двигатель

print("============Загружаем фуру============")

//Загружаем материалы в контейнер
tunkCarOne.carTrunkUpload(haveVolume: 100)

//Разгружаем фуру
tunkCarOne.carTrunkDownload(haveVolume: 10)

//Загружаем под завязку
tunkCarOne.carTrunkUpload(haveVolume: tunkCarOne.maxTrunkCapacity)

//Пробуем положить больше
print("Попробуем загрузить больше груза.")

tunkCarOne.carTrunkUpload(haveVolume: tunkCarOne.maxTrunkCapacity + 100)
