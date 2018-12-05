//
//  SportCar.swift
//  5L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 05.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation


class SportCar: Car{
    enum CarRoof: String{
        case panoramic = "панорамная крыша"
        case hatch = "есть"
        case noHatch = "нет"
    }
    enum Spoiler: String{
        case autoSpoiler = "автоматический"
        case fixSpoiler = "обычный"
    }
    
    var carSpeed: Double
    var brandCar: String
    var maxSpeed: Double
    var leatherInterior: Bool
    var carRoof: CarRoof
    var spoiler: Spoiler
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
    
    init (brandCar: String, maxSpeed: Double, engineCapacity: Double, leatherInterior: Bool, engineStatus: EngineStatus, doorState: DoorState, carRoof:CarRoof, spoiler: Spoiler, carSpeed: Double){
        self.brandCar = brandCar
        self.maxSpeed = maxSpeed
        self.engineCapacity = engineCapacity
        self.engineStatus = engineStatus
        self.doorState = doorState
        self.leatherInterior = leatherInterior
        self.carRoof = carRoof
        self.spoiler = spoiler
        self.carSpeed = carSpeed
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
    func carSpeedUp(haveSpeed: Double) {
        print("\(brandCar) набирает скорость:")
        while carSpeed < haveSpeed{
            guard carSpeed < maxSpeed else{
                carSpeed = haveSpeed
                print("Достигнута максимальная скорость \(maxSpeed) км/ч")
                break
            }
            if (carSpeed+(maxSpeed/10)) < (haveSpeed){
                carSpeed += maxSpeed/10
                print(carSpeed, "км/ч")
            }else{
                carSpeed = haveSpeed
                print(carSpeed, "км/ч")
                break
            }
        }
    }
    func carSpeedDown(haveSpeed: Double){
        print("\(brandCar) снижает скорость:")
        repeat{
            guard carSpeed > 0 else{
                carSpeed = haveSpeed
                print("Машина остановилась \(carSpeed) км/ч")
                break
            }
            if (carSpeed-(maxSpeed/10)) > haveSpeed{
                carSpeed -= maxSpeed/10
                print(carSpeed, "км/ч")
            }else{
                carSpeed = haveSpeed
                print(carSpeed, "км/ч")
                break
            }
            
            
        } while carSpeed >= haveSpeed
    }
}

extension SportCar: CustomStringConvertible{
    var description: String{
        return """
        Машина марки \(brandCar) c объемом двигателя \(engineCapacity) л. и максимальной скорость \(maxSpeed) км/ч.
        Доп. комплектация: кожаный салон - \(leatherInterior == true ? "есть":"нет"), люк - \(carRoof.rawValue), спойлер - \(spoiler.rawValue).
        """
    }
}

