//
//  Generics.swift
//  6L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 07.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation

struct Queue<T: Weightable>: CustomStringConvertible {
    internal var elements:[T] = []  //Насколько безопасно использовать данный вид доступа? Или как иначе обратиться к массиву очереди?
    
    mutating func push (_ element: T){
        return elements.append(element)
    }
    
    mutating func pop () -> T {
        return elements.remove(at: 0)
    }
    
    mutating func count() -> Int {
        return elements.count
    }
    
    var description: String{
        return "Характеристики посылок на складе:\n \(self.elements)"
    }
    
    func filter(array: [T], predicate: (T)-> Bool) -> [T] {
        var tmpArray = [T]()
        for element in array {
            if predicate (element) {
                tmpArray.append(element)
            }
        }
        return tmpArray
    }
    
    subscript(elements: Int ...) -> UInt? {
        var weight: UInt = 0
        
        for index in elements {
            guard(index < self.elements.count) else{
                return nil
            }
            weight += self.elements[index].weight
        }
        return weight
    }
}


