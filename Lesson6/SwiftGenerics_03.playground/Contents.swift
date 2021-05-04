import UIKit

// MARK: - Задача 3*. К выполнению необязательна.

  //MARK: - LIFO

// Indirect enums are enums that need to reference themselves

// 1 Вариант

indirect enum List<Element> {
    case Empty
    case Node(value: Element, next: List<Element>)
    
    init() {
        self = .Empty
    }
}

extension List {
    
    mutating func push(element: Element) {
        self = .Node(value: element, next: self)
    }
    
    mutating func pop() -> Element? {
        switch self {
        case let .Node(value, next):
            self = next
            return value
        case .Empty:
            return nil
        }
    }
    
    func current() -> Element? {
        switch self {
        case let .Node(value, _):
            return value
        case .Empty:
            return nil
        }
    }
}

// 2 Вариант

indirect enum Item<T> {
    case endPoint(value: T)
    case linkNode(value: T, next: Item)
}


  //MARK: - Реализация 1 и 2 варината LIFO на основе enum


var myEnum = List<Int>()
myEnum.push(element: 5)
myEnum.push(element: 10)
myEnum.push(element: 666)
myEnum.push(element: 23)
myEnum.push(element: 48)
print(" Реализация 1 варианта : ")
print("Before pop current value is : \(myEnum.current()!)")
myEnum.pop()
print("After pop current value is :  \(myEnum.current()!)")


let third =  Item.endPoint(value: "Third")
let second = Item.linkNode(value: "Second", next: third)
let first =  Item.linkNode(value: "First", next: second)

var currentNode = first

print(" Реализация 2 варианта : ")

listLoop: while true {
    switch currentNode {
    case .endPoint(let value):
        print(value)
        break listLoop
    case .linkNode(let value, let next):
        print(value)
        currentNode = next
    }
}

  //MARK: - Что говорит Документация 
//Рекурсивные перечисления - это такие перечисления,экземпляры которого являются ассоциативным значением одного или более кейсов перечисления.
//При помощи ключевого слова indirect  перед самим перечислением, вы можете обозначить то, что все члены перечисления поддерживают индиректность.
