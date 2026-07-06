import Foundation


func StrtoInt( stringNumber : String){
    print("String Conversions")
    
//    let stringNumber = "42"
    
    if let convertedToInt = Int(stringNumber){
        print("String \(stringNumber) to Int: \(convertedToInt)")
    }else{
        print("Couldn't convert \(stringNumber)")
    }
}


func StrToFD() {
    let stringDecimal = "3.14159"
    
    if let convertedToFloat = Float(stringDecimal){
        print("String \(stringDecimal) to Float: \(convertedToFloat)")
    }
    if let convertToDouble = Double(stringDecimal)
    {
        print("String \(stringDecimal) to Double: \(convertToDouble)")
    }
}


//print(StrtoInt())
print(StrToFD())
//print(StrtoInt())

let convo = StrtoInt(stringNumber: "42")

print(convo)
