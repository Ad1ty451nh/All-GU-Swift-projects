import Foundation


struct Car{
    var brand: String
    var model: String
    var year: Int
    
    mutating func updateYear(to newYear: Int){
        year = newYear
    }
}

class Vehicle {
    var brand:String
    var model: String
    var year: Int
    
    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
    
    func updateYear(to newYear: Int){
        year =  newYear
    }
}

let car1 = Vehicle(brand: "Porsche", model: "911", year: 2022)
let car2 = car1

car1.updateYear(to: 2024)
print(car1.year)
print(car2.year)

var scar1 = Car(brand: "Porsche", model: "911", year: 2022)
var scar2 = scar1

scar2.updateYear(to: 2024)
print(scar1.year)
print(scar2.year)
