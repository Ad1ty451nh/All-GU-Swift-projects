//import Foundation
//import UIKit
//
//class Animal {
//    var name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    func makeSound() {
//        print("some sound")
//    }
//}
//
//class Dog: Animal{
//    func bark() {
//        print("Woof")
//    }
//}
//
//class Cat: Animal{
//    func meow(){
//        print("Meow")
//    }
//}
//
//let Animals: [Animal] = [
//    Dog(name: "buddy"),
//    Cat(name: "whiskers"),
//    Dog(name: "max"),
//    Animal(name: "generic")
//]
//
//for animal in animals{
//    print("\nchecking: \(animal.name)")
//    
//    if animal is Dog {
//        print("this is a dog")
//    }
//    
//    if let dog = animal as? Dog{
//        dog.bark()
//    }
//    
//    if let cat = animal as? Cat{
//        cat.meow()
//    }
//}
//
//
//let specificDog = Dog(name: "rover")
//let generalAnimal: Animal = specificDog as Animal
//
//
//let mixedArray: [Any] = [
//    42,
//    "Hello",
//    Dog(name: "fido"),
//    3.14
//]
//
//for item in mixedArray{
//    switch item {
//    case let number as Int:
//        print("Found integer: \(number)")
//    case let number as String:
//        print("Found string:\(text)")
//    case let dog as Dog:
//        print("Found dog: \(name)")
//    case let decimal as Double:
//        print("found double:\(decimal)")
//    default:
//        print("unknown type")
//    }
//}
//
//print(mixedArray)
