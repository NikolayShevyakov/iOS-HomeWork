//
//  Protocols.swift
//  7L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 12.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation

protocol Car{
    
    var brandCar: String {get set}
    var engineStatus: EngineStatus {get set}
    
}



protocol CustomStringConvertible {
    func toString () -> String
}
