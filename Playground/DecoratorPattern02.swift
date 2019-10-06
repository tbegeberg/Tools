//: Playground - noun: a place where people can play

import UIKit


protocol Bevarage {
    func cost() -> Int
}

protocol AddonDecoration: Bevarage {
    var baseCost: Bevarage { get }
}



class Espresso: Bevarage {
    func cost() -> Int {
        return 2
    }
}

struct Caramel: AddonDecoration {
    
    let baseCost: Bevarage
    
    func cost() -> Int {
        return 2 + baseCost.cost()
    }
}

struct Milk: AddonDecoration {
    let baseCost: Bevarage
    
    func cost() -> Int {
        return 1 + baseCost.cost()
    }
}



let espresso = Espresso()
print(espresso.cost())

let espressoWithCaramel = Caramel(baseCost: espresso)
let milkAddon = Milk(baseCost: espressoWithCaramel)
print(espressoWithCaramel.cost())
print(milkAddon.cost())







