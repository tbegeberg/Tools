import UIKit

protocol Beverage {
    func cost() -> Double
    func getDescription() -> String
}


class DarkRoast: Beverage {
    
    let description = "Dark Roast Coffee"
    
    func getDescription() -> String {
        return description
    }
    
    func cost() -> Double {
     return 30
    }
}

protocol CondimentDecorator: Beverage {
    var beverage: Beverage {get}
}

class Whip: CondimentDecorator {
  
    var beverage: Beverage
    
    init(beverage: Beverage) {
        self.beverage = beverage
    }
    
    func getDescription() -> String {
        return beverage.getDescription() + ", Whip"
    }
    
    func cost() -> Double {
        return beverage.cost() + 0.3
      }
}


class Mocha: CondimentDecorator {
    
    var beverage: Beverage
    
    init(beverage: Beverage) {
        self.beverage = beverage
    }
    
    func getDescription() -> String {
        return beverage.getDescription() + ", Mocha"
    }
    
    func cost() -> Double {
        return beverage.cost() + 0.5
      }
    
}

var beverage: Beverage = DarkRoast()
beverage = Whip(beverage: beverage)
beverage = Mocha(beverage: beverage)
print(beverage.cost())
print(beverage.getDescription())

