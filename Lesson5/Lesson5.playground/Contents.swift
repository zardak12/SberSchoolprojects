import UIKit

// ДЗ: Реализовать все возможные виды Method dispatch

    //MARK: - Direct Dispatch

// реализация

// 1
class DirectDispatchExampleOne {}

extension DirectDispatchExampleOne {
    func sayHello() {
        print("DirectDispatchExampleOne.sayHello()")
    }
}

// 2
struct DirectDispatchExampleTwo {
    func sayHello() {
        print("DirectDispatchExampleTwo.sayHello()")
    }
}

// 3
final class DirectDispatchExampleThree {
    func sayHello() {
        print("DirectDispatchExampleThree.sayHello()")
    }
}

// вызов
var directDispatchExampleOne = DirectDispatchExampleOne()
var directDispatchExampleTwo = DirectDispatchExampleTwo()
var directDispatchExampleThree = DirectDispatchExampleThree()

directDispatchExampleOne.sayHello()
directDispatchExampleTwo.sayHello()
directDispatchExampleThree.sayHello()


    //MARK: - Virual Table

// реализация

// 1
class VirtualTable {
    func sayHello() {
        print("VirtualTable.sayHello()")
    }
}

//2
class VirtualTableRectangle {
    var width : Double
    var height : Double
    
    init(_ width: Double, _ height: Double){
        self.width = width
        self.height = height
    }
    
    func getArea() -> Double {
        return width*height
    }
}

// вызов
var virtualTable = VirtualTable()
let rectangle = VirtualTableRectangle(2.0,3.0)
virtualTable.sayHello()
let result = rectangle.getArea()
print("Area of VirtualTableRectangle is : \(result)")



    //MARK: - Witness Table

// релаизация
protocol WitnessTableProtocol {
    func sayHello ()
}

class WitnessTable : WitnessTableProtocol {
    func sayHello() {
        print("WitnessTable.sayHello()")
    }
}

// вызов

var witnessTable = WitnessTable()
witnessTable.sayHello()


    //MARK: - Message Dispatch

// реализация
@objcMembers
class MessageDispatch : NSObject {
    dynamic func sayHello() {
        print("MessageDispatch.sayHello")
    }
}

// вызов
var messageDispatch = MessageDispatch()
messageDispatch.sayHello()


