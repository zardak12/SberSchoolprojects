import UIKit

  //MARK: - Command
/// Команда - поведенческий паттерн, который превращает запросы в обьекты
/// Предположим, что нам надо сделать систему умного дома, в котором есть  свет, отопление , вода , звук


/// Данный протокол приводит все наши классы к одному виду
protocol Command {
    func on()
    func off()
}


class Light {
    func turnOn() {
        print("Включаю свет ")
    }
    
    func turnOff() {
        print("Выключаю свет")
    }
}

class LightCommand : Command {
    
    var light : Light
    
    init(light : Light) {
        self.light = light
    }
    func on() {
        self.light.turnOn()
    }
    
    func off() {
        self.light.turnOff()
    }
}

class Water {
    func turnOn() {
        print("Включаю воду")
    }
    
    
    func turnOff() {
        print("Выключаю воду")
    }
}

class WaterCommand : Command {
    var water : Water
    
    init(water : Water) {
        self.water = water
    }
    func on() {
        self.water.turnOn()
    }
    
    func off() {
        self.water.turnOff()
    }
}

class Sound {
    
    func playMusic() {
        print("Включаю музыку ")
    }
    
    func  stop() {
        print("Выключаю музыку ")
    }
}

class SoundCommand : Command {
    
    var sound : Sound
    
    init(sound : Sound) {
        self.sound = sound
    }
    func on() {
        self.sound.playMusic()
    }
    
    func off() {
        self.sound.stop()
    }
}

class Heating {
    func turnHeat(){
        print("Включаю отопление")
    }
    
    func turnOff() {
        print("Выключаю отопление")
    }
}

class HeatingCommand : Command {
    var heat : Heating
    
    init(heat : Heating) {
        self.heat = heat
    }
    
    func on() {
        self.heat.turnHeat()
    }
    
    func off() {
        self.heat.turnOff()
    }
}

/// Factory Method
class Factory {
    
    var light = Light()
    var heat = Heating()
    var sound = Sound()
    var water = Water()
    
    /// Singelton
    static let sharedFactory = Factory()
    
    func createCommand(name : String) -> Command? {
        switch name {
        case "свет":
            return LightCommand(light: light)
        case "вода":
            return WaterCommand(water: water)
        case "отопление":
            return HeatingCommand(heat: heat)
        case "музыка":
            return SoundCommand(sound: sound)
        default:
            return nil
        }
    }
}

/// Применение паттерна Command
var name = "музыка"
var myCommand = Factory.sharedFactory.createCommand(name: name)

if let command = myCommand {
    command.on()
    command.off()
}

   //MARK: - Abstract Factory
/// Абстрактная фабрика — это порождающий паттерн проектирования, который позволяет создавать семейства связанных объектов, не привязываясь к конкретным классам создаваемых объектов.

protocol Button {
    var size : CGRect? {set get}
    
    func pushButton()
}

protocol Image {
    var size : CGRect? {set get}
    
    func pushImage()
}

class ButtonIphone : Button{
    var size: CGRect?
    
    func pushButton() {
        print("Push on Iphone  Button")
    }
}


class ButtonIpad : Button{
    var size: CGRect?
    
    func pushButton() {
        print("Push on Ipad Button")
    }
}

class ImageIphone : Image {
    var size: CGRect?
    
    func pushImage() {
        print("Push on Iphone Image")
    }
}

class ImageIpad : Image {
    var size: CGRect?
    
    func pushImage() {
        print("Push on Ipad Image")
    }
}

protocol AbstractFactory {
    func createButton() ->  Button
    func createImage()  ->  Image
}

class IphoneAbctractFactory : AbstractFactory {
    
    /// Singleton
    static let sharedIphone = IphoneAbctractFactory()
    
    func createButton() -> Button {
        return ButtonIphone()
    }
    
    func createImage() -> Image {
        return ImageIphone()
    }
}

class IpadAbctractFactory : AbstractFactory {
    
    /// Singleton
    static let sharedIpad = IpadAbctractFactory()
    
    func createButton() -> Button {
        return ButtonIpad()
    }
    
    func createImage() -> Image {
        return ImageIpad()
    }
}

/// Применение

/// Iphone
let iphoneButton = IphoneAbctractFactory.sharedIphone.createButton()
let iphoneImage = IphoneAbctractFactory.sharedIphone.createImage()
iphoneButton.pushButton()
iphoneImage.pushImage()
/// Ipad
let ipadButton = IpadAbctractFactory.sharedIpad.createButton()
let ipadImage = IpadAbctractFactory.sharedIpad.createImage()
ipadButton.pushButton()
ipadImage.pushImage()
