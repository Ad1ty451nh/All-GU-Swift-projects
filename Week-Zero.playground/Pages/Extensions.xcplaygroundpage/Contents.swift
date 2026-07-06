struct House {
    let address: String
    let squareFeet: Double
    
    init(address: String, squareFeet: Double) {
        self.address = address
        self.squareFeet = squareFeet
    }
}


extension House{
    var priceEstimate: Double {
        return squareFeet * 200
    }
    
    var sizeCategory:String{
        switch squareFeet{
            case 0...1500: return "Cozy"
            case 1501...2500: return "Medium"
            default:return "Spacious"
        }
    }
}


