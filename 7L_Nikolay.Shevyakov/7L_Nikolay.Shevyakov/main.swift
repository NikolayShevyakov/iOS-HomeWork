//
//  main.swift
//  7L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 12.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import Foundation
/*Вопрос!!!!!!!
1. Можно ли добавить обработку ошибок класса в протоколе, когда я это сделал, то в самом классе компилятор ругался, что класс не соответствует протоколу и нужно добавить эти функции, если я убираю из функций throws, то все работает.
2. Правильно ли я понимаю, что если мы добавили обработку ошибок throws для метода, то вызвать его без реализации try/catch нельзя?
 */
print("\n========================Авто типа грузовик========================\n")
//Создаем экземпляры класса грузовик

var tunkCarOne = TunkCar(brandCar: "Volvo", maxTrunkCapacity: 25000, carTrunk: .carTrailer)

var tunkCarTwo = TunkCar(brandCar: "MAN", maxTrunkCapacity: 15000, carTrunk: .carTunk)

//Выводим в консоль описание первого грузовика
print(tunkCarOne.toString())

//Пробуем запустить двигатель
do{
    try print(tunkCarOne.startEngine()) //Engine Starting
}catch EngineWorkingError.alreadyWorking{
    print("Двигатель уже работает")
}catch EngineWorkingError.alreadyNotWorking{
    print("Двигатель уже заглушен")
}catch let error{
    print(error.localizedDescription)
}

//Пробуем еще раз запустить двигатель для теста обработки ошибок

do{
    try print(tunkCarOne.startEngine()) //Start engine one more time
}catch EngineWorkingError.alreadyWorking{
    print("Двигатель уже работает")
}catch EngineWorkingError.alreadyNotWorking{
    print("Двигатель уже заглушен")
}catch let error{
    print(error.localizedDescription)
}

//Начинаем процесс загрузки фуры
print("============Загружаем фуру============")

do{
    for _ in 1...10{
        try tunkCarOne.carTrunkUpload(volume: 2501)
    }
}catch CarTrailerError.invalidSelection{
    print("Нечего наполнять, у данного грузовика нет прицепа.")
}catch CarTrailerError.overFlow {
    print("Недостаточно места, возможно добавить еще: \(tunkCarOne.maxTrunkCapacity - tunkCarOne.trunkCapacity)")
}catch let error{
    print(error.localizedDescription)
}

print("Загруженность фуры: \(tunkCarOne.trunkCapacity)")

//Начинаем процесс разгрузки фуры

do{
    for _ in 1...10{
        try tunkCarOne.carTrunkDownload(volume: 2501)
    }
}catch CarTrailerError.invalidSelection{
    print("Нечего наполнять, у данного грузовика нет прицепа.")
}catch CarTrailerError.missingDataError {
    print("Невозможно достать груз, в машине осталось только: \(tunkCarOne.trunkCapacity)")
}catch let error{
    print(error.localizedDescription)
}

//Создаем экземпляр класса фура без прицепа, для теста обработки ошибок
var tunkCarThree = TunkCar(brandCar: "Renault", maxTrunkCapacity: 100, carTrunk: .noTrailer)
//Пробуем загрузить новую фуру
print("============Пробуем загрузить фуру без прицепа============")

do{
    for _ in 1...10{
        try tunkCarThree.carTrunkUpload(volume: 2501)
    }
}catch CarTrailerError.invalidSelection{
    print("Нечего наполнять, у данного грузовика нет прицепа.")
}catch CarTrailerError.overFlow {
    print("Недостаточно места, возможно добавить еще: \(tunkCarThree.maxTrunkCapacity - tunkCarThree.trunkCapacity)")
}catch let error{
    print(error.localizedDescription)
}

//Так как без прицепа была перехвачена ошибка, добавляем прицеп и пробуем снова загрузить фуру
print("============Устанавливаем прицеп и пробуем загрузить еще раз============")

tunkCarThree.carTrunk = .carTrailer

do{
    for _ in 1...10{
        try tunkCarThree.carTrunkUpload(volume: 2501)
    }
}catch CarTrailerError.invalidSelection{
    print("Нечего наполнять, у данного грузовика нет прицепа.")
}catch CarTrailerError.overFlow {
    print("Недостаточно места, возможно добавить еще: \(tunkCarThree.maxTrunkCapacity - tunkCarThree.trunkCapacity)")
}catch let error{
    print(error.localizedDescription)
}

//Для успешной загрузки необходимо также изменить объем максимальной нагрузки
print("============Необходимо увеличить максимальную загруженность при подсоединении прицепа============")
tunkCarThree.maxTrunkCapacity = 10000

do{
    for _ in 1...10{
        try tunkCarThree.carTrunkUpload(volume: 2501)
    }
}catch CarTrailerError.invalidSelection{
    print("Нечего наполнять, у данного грузовика нет прицепа.")
}catch CarTrailerError.overFlow {
    print("Недостаточно места, возможно добавить еще: \(tunkCarThree.maxTrunkCapacity - tunkCarThree.trunkCapacity)")
}catch let error{
    print(error.localizedDescription)
}
