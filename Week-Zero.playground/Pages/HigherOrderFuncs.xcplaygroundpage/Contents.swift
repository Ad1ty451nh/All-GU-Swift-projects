import Foundation

let numbers = [1,2,3,4,5]

let multiplied = numbers.map { $0 * 10 }
print(multiplied)


let evens = numbers.filter{$0 % 2 == 0}
print(evens)

let sum = numbers.reduce(0) {$0 + $1}
print(sum)

let bills = [
"Diet Coke 12.99",
"20.50 for cookie",
"52.78 for 4 slices of pizza"
]
  
