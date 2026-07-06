import Foundation

var data:Int?
var myData: Int

func convertToInt(input:String) -> Int?{
    return Int(input)
}

data = convertToInt(input: "22")
print(data!)

data = convertToInt(input: "1")
print(data!)

//data = convertToInt(input: "QWERTY")
//print(data)

