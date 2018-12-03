//
//  main.swift
//  4L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 03.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation

enum Transmission: String{
    case auto = "Автоматическая коробка", manual = "Механическая коробка"
}
enum EngineState: String{
    case start = "Двигатель запущен", stop = "Двигатель заглушен"
}
enum CarType: String{
    case sportCar = "Легковой автомобиль", truck = "Грузовик"
}

class Car{
    let carBrand: String
    let transmission: Transmission
    var km: Double{
        didSet{
            print("Машина проехала \(km - oldValue)км")
        }
    }
    var engineState: EngineState
    
    init(carBrand: String,transmission: Transmission,km: Double,engineState: EngineState) {
        self.carBrand = carBrand
        self.transmission = transmission
        self.km = km
        self.engineState = engineState
    }
    
    func startEngine(){
        self.engineState = .start
        print("Завели машину. Счастливого пути!")
    }
    
    func stopEngine(){
        self.engineState = .stop
        print("Приехали, глуши машину!")
    }
}

enum TrailerStatus: String {
    case installed = "Прицеп установлен", notInstalled = "Прицеп откреплен"
}
enum Trailer: String{
    case yes = "Есть прицеп", no = "Нет прицепа"
}
//SoprtCar аналогично
class TruckCar: Car{
    let trailer: Trailer
    var trailerStatus: TrailerStatus
    
    init(carBrand: String, transmission: Transmission, km: Double, engineState: EngineState, trailer: Trailer,trailerStatus: TrailerStatus){
        self.trailer = trailer
        self.trailerStatus = trailerStatus
        super.init(carBrand: carBrand, transmission: transmission, km: km, engineState: engineState)
    }
    
    func installTrailer() {
        self.trailerStatus = .installed
        print("Прицеп установлен.")
    }
    
    func deInstallTrailer() {
        self.trailerStatus = .notInstalled
        print("Прицеп отсоединен.")
    }
    
    override func startEngine(){
        if trailer == .yes {
            if trailerStatus == .notInstalled{
                print("Внимание!!!Прицеп не установлен! Установить прицеп?(да/нет)")
                let checkInstallTrailer = readLine()
                if checkInstallTrailer == "да"{
                    installTrailer()
                    super.startEngine()
                }else{
                    print("Вы не установили прицеп и оставили весь груз на складе!")
                    super.startEngine()
                }
            }else{
                super.startEngine()
            }
        }else{
            super.startEngine()
        }
    }
    
}

var myTruck = TruckCar(carBrand: "Volvo", transmission: .auto, km: 100.0, engineState: .stop, trailer: .yes, trailerStatus: .notInstalled)
var myTruck2 = TruckCar(carBrand: "MAN", transmission: .manual, km: 1_000_000, engineState: .stop, trailer: .no, trailerStatus: .notInstalled)

repeat{
    myTruck.startEngine()
}while(myTruck.engineState == .stop)


print("\n============Характеристики моего грузовика============\n")
print("Бренд - \(myTruck.carBrand)")
print("Коробка передач - \(myTruck.transmission.rawValue)")
print("Пробег - \(myTruck.km)")
print("Состояние двигателя - \(myTruck.engineState.rawValue)")
print("Наличие прицепа - \(myTruck.trailer.rawValue)")
print("Состояние прицепа - \(myTruck.trailerStatus.rawValue)")


print("\n============Характеристики другого грузовика============\n")
print("Бренд - \(myTruck2.carBrand)")
print("Коробка передач - \(myTruck2.transmission.rawValue)")
print("Пробег - \(myTruck2.km)")
print("Состояние двигателя - \(myTruck2.engineState.rawValue)")
print("Наличие прицепа - \(myTruck2.trailer.rawValue)")
print("Состояние прицепа - \(myTruck2.trailerStatus.rawValue)")

