import UIKit

// MARK: - Задача 2

  //MARK: - Protocol

protocol Container {
    
    associatedtype Element
    
    var count : Int {get}                   // возвращает количество элементов
    var isEmpty : Bool {get}                // проверяет пустой он или нет
    subscript ( i: Int) -> Element {get}    // возвращает элемент по индексу
    
    mutating func append(_ item : Element)  // добавляет новый элемент
}


  //MARK: - LIFO

struct Stack<T> : Container {

    var items = [T]()
    
    
    var top : T? {                          // показывает последний элемент
            return items.last
    }
    
    
    mutating func push(element : T) {       // добавляет элемент
        items.append(element)
    }
    
    mutating func pop()->T? {               // возвращает последний
        if !items.isEmpty {
            return items.removeLast()
        }
        else {
            return nil
        }
    }
    
    // Имплементация протокола Container
    
    
    var count : Int {
            return items.count
    }
    
    var isEmpty : Bool {
            return items.isEmpty
    }
    
    
    subscript(i: Int) -> T {
        return items[i]
    }
    
    mutating func append(_ item: T) {
        push(element: item)
    }
    
}
  //MARK: - FIFO

struct Queue<T> : Container {
    
    var items = [T]()
    

    
    
    var head : T? {                         //  голова очереди
        return items.first
    }
    
    var tail : T? {                         // хвост очереди
        return items.last
    }
    
    mutating func enqueue(elem : T){        // добавляет элемент в очередь
        items.append(elem)
    }
    
    mutating func dequeue() -> T? {         // забирает элемент из очереди
        if !items.isEmpty {
            return items.removeFirst()
        }
        else {
            return nil
        }
    }
    
    // Имплементация протокола Container

    var count : Int {
        return items.count
    }
    
    var isEmpty : Bool {
        return items.isEmpty
    }
    
    
    subscript(i: Int) -> T {
        return items[i]
    }
    
    mutating func append(_ item: T) {
        enqueue(elem: item)
    }
}

  //MARK: - РЕАЛИЗАЦИЯ LIFO и FIFO


// LIFO

var listFirst = Stack<Int>()
var listSecond = Stack<String>()

listFirst.append(1)
listFirst.append(2)
listFirst.append(3)
listFirst.append(4)
listFirst.push(element:666)
print("Реализация Списка")
print("List First, his count: \(listFirst.count) ")
if !listFirst.isEmpty {
    print("His top : \(listFirst.top!)")
}
listFirst.pop()
if !listFirst.isEmpty {
    print("After pop his top is  : \(listFirst.top!)")
}

// FIFO

var myQueue = Queue<String>()
myQueue.enqueue(elem: "Hello")
myQueue.enqueue(elem: "my")
myQueue.enqueue(elem: "friend")
myQueue.enqueue(elem: "Mark")
print("Реализация Oчереди")
if (!myQueue.isEmpty && myQueue.count > 1) {
    print("my HEAD: \(myQueue.head!)")
    print("My TAIL : \(myQueue.tail!)")
}

myQueue.dequeue()

if (!myQueue.isEmpty && myQueue.count > 1) {
    print("After dequeue my HEAD : \(myQueue.head!)")
}

