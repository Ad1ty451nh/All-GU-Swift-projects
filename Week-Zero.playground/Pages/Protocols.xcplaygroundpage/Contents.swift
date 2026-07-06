import Foundation

protocol GameCharacterRules {
    var name : String {get}
    var health: Int {get set}
    
    func attack() -> Int
    func makeSound()
    
}

struct Warrior: GameCharacterRules{
    var name: String
    var health: Int
    var swordPower: Int
    func attack()-> Int {
        return swordPower * 2
    }
    
    func  makeSound() {
        print("\(name) says : For Glory")
    }
}

struct Wizard: GameCharacterRules {
    var name: String
    var health: Int
    var magicPower : Int
    
    func attack()-> Int{
        return magicPower * 3
    }
    
    func makeSound() {
        print("\(name) says: Electricityyyy Zaapppp")
    }
}

struct Barbarian : GameCharacterRules{
    var name:String
    
    var health: Int
    
    func attack() -> Int {
        return 30
    }
    
    func makeSound(){
        print("\(name) says: Helll yeahhh")
    }
}

let warrior1 = Warrior(name: "Knight", health: 200, swordPower: 15)
warrior1.makeSound()
let damageDone = warrior1.attack()
print("Gives damage of \(damageDone)")


let wizard1 = Wizard(name: "EWiz", health: 80, magicPower: 25)
wizard1.makeSound()
let magicDone = wizard1.attack()
print("Gives damage of \(magicDone)")

let barbarian1 = Barbarian(name: "Evo Barbs", health: 100)
var attack = barbarian1.attack()
barbarian1.makeSound()
print("Gives damage of \(attack)")
