import Foundation


// Challenge : FizzBuzz
func FizzBuzz (input: Int)-> [String]{
    
    var ans: [String] = []
    
    for i in 1...input{
        if i % 3 == 0 && i % 5 == 0{
            ans.append("Fizzbuzz")
        } else if i % 3 == 0 {
            ans.append("Fizz")
        } else if i % 5 == 0 {
            ans.append("Buzz")
        } else {
            ans.append(String(i))
        }
    }
    return ans
}

print(FizzBuzz(input: 45))
