import UIKit

protocol Human {
    var name: String {get set}
    func run()
    func eat()
}

class Hunter: Human {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func run() {
        print("Hunter: \(name) is running")
    }
    
    func eat() {
        print("Hunter: \(name) is eating")
    }
}

class Worker: Human {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func run() {
        print("Worker: \(name) is running")
    }
    
    func eat() {
        print("Worker: \(name) is eating")
    }
}

enum HumanTypes {
    case worker
    case hunter
}

class HumanFactory {
    
    static let shared = HumanFactory()
    
    func createHuman(humanType: HumanTypes, name: String) -> Human {
        switch humanType {
        case .worker:
            return Worker(name: name)
        case .hunter:
            return Hunter(name: name)
        }
    }
}


var peterTheHunter = HumanFactory.shared.createHuman(humanType: .hunter, name: "Peter")
peterTheHunter.eat()
peterTheHunter.name = "Lars"
print(peterTheHunter.name)
