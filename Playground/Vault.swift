//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


struct Product {
    var name: String
    var price: Int
}

struct Money {
    var vault: Int
}


protocol Company {
    func buy<T>(product: T, money: Money)
    func sell<T>(product: T.Type, money: Money) -> T?
}




class Netto: Company {
    
    let tanks = Product(name: "Tank", price: 10)
    
    func buy<T>(product: T, money: Money) {
        print(product)
    }
    
    func sell<T>(product: T.Type, money: Money) -> T? {
        print(product)
        return T
    }

    
}


