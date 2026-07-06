import Foundation

func TakeCliInputs(promptText: String) -> String {
    print(promptText, terminator: "")
    return readLine() ?? ""
}

//var input1 = TakeCliInputs(promptText: "Enter Value 1 : ")
//
//var input2 = TakeCliInputs(promptText: "Enter Value 2 : ")


func performOperation(sign operation: String, input1: Int, input2: Int) -> Int {
    
    switch operation {
    
    case "+" :
        return input1 + input2
        
    case "-" :
        return input1 - input2
        
    case "*" :
        return input1 * input2
        
    case "/" :
        return input1 / input2
        
        
    default :
        return 0
    }
}
