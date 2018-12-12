//
//  Erros.swift
//  7L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 12.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation

enum CarTrailerError: Error{
    
    case invalidSelection //У данного вида грузовика нет прицепа
    case overFlow //Цистерна переполнена
    case missingDataError // Цистерна пустая
}

enum EngineWorkingError: Error{
    case alreadyWorking //двигатель уже заведен
    case alreadyNotWorking //двигатель уже заглушен
}
