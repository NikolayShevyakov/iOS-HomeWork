//
//  TunkCar.swift
//  7L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 12.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation

class TunkCar: Car, CustomStringConvertible{    
    enum CarTrunk: String{
        case carTunk = "Цистерна"
        case carTrailer = "Контейнер"
        case noTrailer = "Без прицепа"
    }
    
    var trunkCapacity: Double
    var brandCar: String
    var maxTrunkCapacity: Double
    var carTrunk: CarTrunk {
        didSet{
            print("Прицеп установлен")
        }
    }
    var engineStatus: EngineStatus{
        didSet{
            switch self.engineStatus{
            case .start:
                print("Двигатель запущен")
            case .stop:
                print("Двигатель заглушен")
            }
        }
    }
    
    
    init (brandCar: String, maxTrunkCapacity: Double, carTrunk: CarTrunk){
        self.brandCar = brandCar
        self.engineStatus = .stop
        self.maxTrunkCapacity = maxTrunkCapacity
        self.trunkCapacity = 0
        self.carTrunk = carTrunk
    }
    
    func startEngine() throws{
        guard self.engineStatus == .stop else{
            throw EngineWorkingError.alreadyWorking
        }
        self.engineStatus = .start
    }
    func stopEngine() throws{
        guard self.engineStatus == .start else{
            throw EngineWorkingError.alreadyNotWorking
        }
        self.engineStatus = .stop
    }
    
    func carTrunkUpload(volume: Double) throws{
        
        guard self.carTrunk != .noTrailer else {
            throw CarTrailerError.invalidSelection
        }
        guard (trunkCapacity + volume) <= self.maxTrunkCapacity else {
            throw CarTrailerError.overFlow
        }
        trunkCapacity += volume
        print("Загружаем фуру \(brandCar): \(trunkCapacity)")
    }
    func carTrunkDownload (volume: Double) throws{
        
        guard self.carTrunk != .noTrailer else {
            throw CarTrailerError.invalidSelection
        }
        guard (trunkCapacity - volume) >= 0 else {
            throw CarTrailerError.missingDataError
        }
        trunkCapacity -= volume
        print("Разгружаем \(brandCar): \(trunkCapacity)")
    }
    
    func toString() -> String {
        return """
        Машина марки \(brandCar) c максимальной грузоподъемностью \(maxTrunkCapacity) л, с прицепом типа - \(carTrunk.rawValue).
        """
    }
}

