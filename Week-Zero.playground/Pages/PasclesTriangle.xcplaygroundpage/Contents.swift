import Foundation

func pascle (n: Int) {
    var space = n - 1
    
    for i in 0...10 where i % 2 == 1{
        print("*")
    }
    
    for i in 0...10 where i % 2 == 1 {
        print(" ")
    }
}

