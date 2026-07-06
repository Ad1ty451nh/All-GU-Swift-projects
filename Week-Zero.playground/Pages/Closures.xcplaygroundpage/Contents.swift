import Foundation

func addNumber(a: Int,b: Int) -> Int{
    return a + b
}

let addClosure: (Int,Int) -> Int = { (a: Int , b: Int) -> Int in
    return a + b
}

let addSimple = {(a: Int, b: Int) in
    return a + b
}

let addShorter = {(a: Int, b: Int) in a + b}

let addShortest: (Int,Int) -> Int = { $0 + $1}

addClosure(10,20)
addSimple(25,35)
addShorter(60,50)
addShortest(20,40)
