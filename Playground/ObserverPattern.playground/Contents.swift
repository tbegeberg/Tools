import UIKit

protocol Subject {
    func registerObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyObserver()
}

protocol Observer:AnyObject {
    func update(value: Int)
}

class SimpleSubject: Subject {
    private var observers = [Observer]()
    private var value = 0
    static let shared = SimpleSubject()
    
    func registerObserver(observer: Observer) {
        self.observers.append(observer)
    }
    
    func removeObserver(observer: Observer) {
        let index = observers.firstIndex { (listedObserver) in
            return observer === listedObserver
        }
        guard let indexNumber: Int = index else {
            return
        }
        observers.remove(at: indexNumber)
    }
    
    func notifyObserver() {
        for observer in observers {
            observer.update(value: value)
        }
    }
    
    func setValue(value: Int){
        self.value = value
        self.notifyObserver()
    }
}


class simpleObserver: Observer {
    
    private var value = 0
    private let simpleSubject: SimpleSubject
    
    init() {
        self.simpleSubject = SimpleSubject.shared
        self.simpleSubject.registerObserver(observer: self)
    }
    
    func update(value: Int) {
        self.value = value
        self.display()
    }
    
    func display() {
        print(value)
    }
    
}


simpleObserver()
let simpleSubject = SimpleSubject.shared
simpleSubject.setValue(value: 19)

