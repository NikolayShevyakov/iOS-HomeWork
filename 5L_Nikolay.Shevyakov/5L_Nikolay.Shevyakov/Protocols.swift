//
//  Protocols.swift
//  5L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 05.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation

protocol Car{

    var brandCar: String {get}
    var engineCapacity: Double {get}
    var engineStatus: EngineStatus {get}
    
    func startEngine()
    func stopEngine()
    func openDoors()
    func closeDoors()
}

extension Car{
    func startEngine(){}
    func stopEngine(){}
    func openDoors(){}
    func closeDoors(){}

}
