//
//  WareHouse.swift
//  6L_Nikolay.Shevyakov
//
<<<<<<< HEAD
//  Created by Nikolay Shevyakov on 10.12.2018.
=======
//  Created by Nikolay Shevyakov on 07.12.2018.
>>>>>>> 6_lesson_NShevyakov
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation
<<<<<<< HEAD
=======

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
>>>>>>> 6_lesson_NShevyakov
