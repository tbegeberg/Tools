import UIKit

protocol FlyBehavior {
    func fly()
}

class FlyNoWay: FlyBehavior {
    func fly() {
        print("I cannot fly")
    }
}

class FlyWithWay: FlyBehavior {
    func fly() {
        print("I can fly")
    }
}


class Duck {
    
    var flyBehavior: FlyBehavior?
    
    func setFlyBehavior(flyBehavior: FlyBehavior) {
        self.flyBehavior = flyBehavior
    }
    
    func performFly() {
        self.flyBehavior?.fly()
    }
    
}

class RubberDuck: Duck {
    
    func createDuck() {
        self.setFlyBehavior(flyBehavior: FlyNoWay())
        self.performFly()
    }
    
    
}

let rubberDuck = RubberDuck()
rubberDuck.createDuck()

