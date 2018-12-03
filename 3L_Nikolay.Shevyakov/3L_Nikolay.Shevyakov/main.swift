//
//  main.swift
//  3L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 03.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation

enum CarEngineState : String{
    case start = "Двигатель запущен"
    case stop = "Двигатель заглушен"
}

enum CarWindowsState : String{
    case open = "Окна открыты"
    case close = "Окна закрыты"
}



struct PassengerCar{
    var brand: String
    var releaseYear: Int
    var trunkStorage: Double
    var trunkFilling: Double {//Видимо тут в switch нужно было использовать enum, но что-то перемудрил и не знаю как реализовать теперь это
        didSet{
            if trunkFilling > trunkStorage {
                print("Превышен объем багажника")
                trunkFilling = oldValue
                print("Можно загрузить еще только \(trunkStorage - trunkFilling)кг")
            }
        }
        willSet{
            if newValue < trunkStorage {
                switch newValue{
                case 0..<trunkFilling:
                    print("Из багажника достали вещи \(trunkFilling - newValue)кг осталось еще место - \(trunkStorage - newValue)кг")
                case trunkFilling..<trunkStorage:
                    print("В багажник положили вещи \(newValue - trunkFilling)кг осталось еще место - \(trunkStorage - newValue)кг")
                default:
                    print("Просто посмотрели в багажник")
                }
            }else if newValue == trunkStorage{
                print("Загрузили еще \(newValue - trunkFilling), багажник забит под завязку")
            }
        }
    }
    
    var engineState: CarEngineState{
        willSet{
            if newValue == .start {
                print("Двигатель запущен!")
            } else {
                print("Двигатель заглушен!")
            }
        }
    }
    
    mutating func startEngine(){
        self.engineState = .start
    }
    
    mutating func stopEngine(){
        self.engineState = .stop
    }
    
    var windowsState: CarWindowsState{
        didSet{
            if oldValue == .close {
                print("Открываем окна")
            } else {
                print("Закрываем окна")
            }
        }
    }
    
    init(){
        brand = "Hyundai"
        releaseYear = 2015
        trunkStorage = 400.0
        trunkFilling = 3.0
        engineState = .start
        windowsState = .open
    }
    init?(brand: String,releaseYear: Int, trunkStorage: Double, trunkFilling: Double, engineState: CarEngineState, windowsState: CarWindowsState){
        guard brand != "" && releaseYear > 0 && trunkFilling > 0.0 && trunkFilling >= 0.0 else{
            return nil
        }
        self.brand = brand
        self.releaseYear = releaseYear
        self.trunkStorage = trunkStorage
        self.trunkFilling = trunkFilling
        self.engineState = engineState
        self.windowsState = windowsState
    }
    
}
//==============================================Структура Грузовика==============================================
struct TruckCar{
    var brand: String
    var releaseYear: Int
    var bodyworkStorage: Double
    var bodyworkFilling: Double {//Можно в данной ситуации применить перечисления?
        didSet{
            if bodyworkFilling > bodyworkStorage {
                print("Превышен объем багажника")
                bodyworkFilling = oldValue
                print("Можно загрузить еще только \(bodyworkStorage - bodyworkFilling)кг")
            }
        }
        willSet{
            if newValue < bodyworkStorage {
                switch newValue{
                case 0..<bodyworkFilling:
                    print("Из багажника достали вещи\(bodyworkFilling - newValue) осталось еще место - \(bodyworkStorage - newValue)кг")
                case bodyworkFilling..<bodyworkStorage:
                    print("В багажник положили \(newValue - bodyworkFilling) осталось еще место - \(bodyworkStorage - newValue)кг")
                default:
                    print("Просто посмотрели в багажник")
                }
            }else if newValue == bodyworkStorage{
                print("Загрузили еще \(newValue - bodyworkFilling), багажник забит под завязку")
            }
        }
    }
    
    var engineState: CarEngineState{
        willSet{
            if newValue == .start {
                print("Двигатель запущен!")
            } else {
                print("Двигатель заглушен!")
            }
        }
    }
    
    mutating func startEngine(){
        self.engineState = .start
    }
    
    mutating func stopEngine(){
        self.engineState = .stop
    }
    
    var windowsState: CarWindowsState{
        didSet{
            if oldValue == .close {
                print("Открываем окна")
            } else {
                print("Закрываем окна")
            }
        }
    }
    
    init(){
        self.brand = "Volvo"
        self.releaseYear = 2017
        self.bodyworkStorage = 25000
        self.bodyworkFilling = 0.0
        self.engineState = .stop
        self.windowsState = .close
    }
    init?(brand: String,releaseYear: Int, bodyworkStorage: Double, bodyworkFilling: Double, engineState: CarEngineState, windowsState: CarWindowsState){
        guard brand != "" && releaseYear > 0 && bodyworkFilling > 0.0 && bodyworkFilling >= 0.0 else{
            return nil
        }
        self.brand = brand
        self.releaseYear = releaseYear
        self.bodyworkStorage = bodyworkStorage
        self.bodyworkFilling = bodyworkFilling
        self.engineState = engineState
        self.windowsState = windowsState
    }
    
}


let myCar1 = PassengerCar(brand: "Hyundai", releaseYear: 2017, trunkStorage: 100.0, trunkFilling: 50.0, engineState: .stop, windowsState: .close)
let myTruckCar = TruckCar(brand: "Volvo", releaseYear: 2015, bodyworkStorage: 5000.0, bodyworkFilling: 50.0, engineState: .stop, windowsState: .close)

/* Проверка ограничения на ввод отрицательных чисел
 if let myCar1 = myCar1{
 print(myCar1.trunkFilling)
 }
 */

print("Свойства экземпляра грузового авто:")
var someBigVehicle = TruckCar()
print("Бренд - \(someBigVehicle.brand)")
print("Год выпуска - \(someBigVehicle.releaseYear)")
print("Объем багажника - \(someBigVehicle.bodyworkStorage)")
print("Состояние багажника - \(someBigVehicle.bodyworkFilling)")
print("Состояние двигателя - \(someBigVehicle.engineState.rawValue)")
print("Состояние окон - \(someBigVehicle.windowsState.rawValue)")

print("==============================================================================================================")
print("Свойства экземпляра легкового авто:")
var someSmallVehicle = PassengerCar()
print("Бренд - \(someSmallVehicle.brand)")
print("Год выпуска - \(someSmallVehicle.releaseYear)")
print("Объем багажника - \(someSmallVehicle.trunkStorage)")
print("Состояние багажника - \(someSmallVehicle.trunkFilling)")
print("Состояние двигателя - \(someSmallVehicle.engineState.rawValue)")
print("Состояние окон - \(someSmallVehicle.windowsState.rawValue)")

