//
//  TunkCar.swift
//  5L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 05.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation


class TunkCar: Car{

    enum CarTrunk: String{
        case carTunk = "Цистерна"
        case carTrailer = "Контейнер"
    }
    
    var trunkCapacity: Double
    var brandCar: String
    var maxTrunkCapacity: Double
    var carTrunk: CarTrunk
    var engineCapacity: Double
    var engineStatus: EngineStatus{
        didSet{
            print(engineStatus.rawValue)
        }
    }
    var doorState: DoorState{
        didSet{
            print(doorState.rawValue)
        }
    }
    
    init (brandCar: String, maxTrunkCapacity: Double, engineCapacity: Double, engineStatus: EngineStatus, doorState: DoorState, trunkCapacity: Double, carTrunk: CarTrunk){
        self.brandCar = brandCar
        self.maxTrunkCapacity = maxTrunkCapacity
        self.engineCapacity = engineCapacity
        self.engineStatus = engineStatus
        self.doorState = doorState
        self.trunkCapacity = trunkCapacity
        self.carTrunk = carTrunk
    }
    
    
    func startEngine(){
        print("Заводим двигатель")
        engineStatus = .start
    }
    func stopEngine(){
        print("Глушим двигатель")
        engineStatus = .stop
    }
    func openDoors(){
        print("Открываем двери")
        doorState = .open
    }
    func closeDoors(){
        print("Закрываем двери")
        doorState = .close
    }
    func carTrunkUpload(haveVolume: Double) {
        print("Загружаем фуру \(brandCar):")
        while trunkCapacity < haveVolume{
            guard trunkCapacity < maxTrunkCapacity else{
                trunkCapacity = haveVolume
                print("Достигнут максимальный объем контейнера \(maxTrunkCapacity) л")
                break
            }
            if (trunkCapacity+(maxTrunkCapacity/10)) < (haveVolume){
                trunkCapacity += maxTrunkCapacity/10
                print(trunkCapacity, "л")
            }else{
                trunkCapacity = haveVolume
                print(trunkCapacity, "л")
                break
            }
        }
    }
    func carTrunkDownload (haveVolume: Double){
        print("Разгружаем \(brandCar):")
        repeat{
            guard trunkCapacity > 0 else{
                trunkCapacity = haveVolume
                print("Контейнер пуст")
                break
            }
            if (trunkCapacity-(maxTrunkCapacity/10)) > haveVolume{
                trunkCapacity -= maxTrunkCapacity/10
                print(trunkCapacity, "л")
            }else{
                trunkCapacity = haveVolume
                print(trunkCapacity, "л")
                break
            }
            
            
        } while trunkCapacity >= haveVolume
    }
}

extension TunkCar: CustomStringConvertible{
    var description: String{
        return """
        Машина марки \(brandCar) c объемом двигателя \(engineCapacity) л. и максимальной скорость \(maxTrunkCapacity) л, с прицепом типа - \(carTrunk.rawValue).
        """
    }
}

