//
//  WareHouse.swift
//  6L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 12.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation

class WareHouse: Weightable{
    
    internal var width: UInt
    internal var height: UInt
    internal var length: UInt
    internal var weight: UInt
    
    init (){
        self.width = UInt.random(in: 1...100)
        self.height = UInt.random(in: 1...200)
        self.length = UInt.random(in: 1...150)
        self.weight = UInt.random(in: 1...15)
    }
    
    
}

extension WareHouse : CustomStringConvertible{
    var description : String{
        return "Коробка Ш: \(self.width) В: \(self.height) Д: \(self.length) Вес: \(self.weight)"
    }
}
