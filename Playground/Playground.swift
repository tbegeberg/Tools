//: Playground - noun: a place where people can play
/*
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
        
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column:Int) -> Double {
        get{
            assert(indexIsValid(row: row, column: column), "Index is out of valid")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index is not valid")
            grid[(row * columns) + column] = newValue
        }
    }
    
}

var matrix = Matrix(rows: 2, columns: 2)

matrix[0, 0] = 5.6
matrix[1, 1] = 9.9

// Inheritance

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) milea per hour"
    }
    
    func makeNoise () {
        
    }
}

let volvoX305 = Vehicle()
volvoX305.currentSpeed = 45.2
print("Vehicle: \(volvoX305.description)")

class Bicycle: Vehicle {
    var hasBasket = false
}


let centurianx10 = Bicycle()
centurianx10.hasBasket = true
print("Vehicle: \(centurianx10.hasBasket)")
centurianx10.currentSpeed = 15.0

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandemCenturian = Tandem()
tandemCenturian.hasBasket = true
tandemCenturian.currentNumberOfPassengers = 2
tandemCenturian.currentSpeed = 10.0
print("Tandem \(tandemCenturian.description)")

// Overriding methods 

class Train: Vehicle{
    override func makeNoise() {
        print("Choo choo")
    }
}

class Car: Vehicle {
    var gear = 1
    override var description: String{
        return super.description + " in gear \(gear)"
    }
}

let bmwX5 = Car()
bmwX5.currentSpeed = 90.0
bmwX5.gear = 5
print("Car\(bmwX5.description)")


class AutomaticCar : Car {
    override var currentSpeed: Double {
        didSet{
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automaticBMW = AutomaticCar()
automaticBMW.currentSpeed = 35.0
print("Automatic BMW: \(automaticBMW.description)")


// INIT

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("defualt temperature is \(f.temperature)")

struct Celsius {
    var temperatureInCelsius : Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin:Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212)
print(boilingPointOfWater)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfWater)
let bodyTemperature = Celsius(37.0)
print(bodyTemperature)



struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white:Double) {
        red = white
        green = white
        blue = white
    }
    
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGrey = Color(white: 0.5)

class SurveyQuestion {
    var text: String
    var response: String?
    init(text:String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
    func answer() {
        print(response!)
    }
}

let wineQuestion = SurveyQuestion(text: "Do you like wine")
wineQuestion.ask()
wineQuestion.response = "Yes I love wine"
wineQuestion.answer()

// Default Initializers

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

// different ways to initialize Size and Point

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size:Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

var rectangleBig = Rect()
print(rectangleBig.size, rectangleBig.origin)

var originREct = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

var centerRect = Rect(center: Point(x:4.0, y:4.0), size: Size(width: 3.0, height: 3.0))
*/

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

class Food {
    var name: String
    init(name:String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}


class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name:String) {
        self.init(name: name, quantity: 1)
    }
}

class ShoppingListItem: RecipeIngredient{
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}


var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]

breakfastList[0].name = "Orange Juice"
breakfastList[0].purchased = true
for item in breakfastList {
print(item.description)
}

breakfastList[1].purchased = true

for item in breakfastList {
    print(item.description)
}


// Failable INIT

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")

if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
            case "K":
            self = .kelvin
            case "C":
            self = .celsius
            case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so init succededed")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so init failed")
}


enum TemperatureUnitNew: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

let fahrenheitUnitNew = TemperatureUnitNew(rawValue: "F")
if fahrenheitUnitNew != nil {
    print("This is a defined temperature unit, so INI succeeded")
}

let unknownUnitNew = TemperatureUnitNew(rawValue: "X")
if unknownUnitNew == nil {
print("This is not a defined temperature unit, so init failed")
}

// failable init subclasses

class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("In your cart: Item \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirt = CartItem(name: "shirt", quantity: 0) {
    print("Item \(zeroShirt.name), quantity: \(zeroShirt.quantity)")
}
    else {
        print("Unable it init zero shirts")
}


// DeInitilizers

class Bank{
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
    
}

var playerOne: Player? = Player(coins: 100)
print("Coins in bank \(Bank.coinsInBank)")

playerOne!.win(coins: 2_000)
print("PlayerOne has \(playerOne!.coinsInPurse)")

playerOne = nil
print("Coins in bank \(Bank.coinsInBank)")

// Automatic Reference Counting

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being init")
    }
    
    deinit {
        print("\(name) is being deInit")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "Peter")

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
//not deInit yet since ref3 still has a strong reference

reference3 = nil

//strong reference cycle
class NewPerson {
    let name: String
    init(name:String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit {
        print("\(name) is being deInit")
    }
}

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    
    }
    weak var tenant: NewPerson?
    deinit {
        print("Apartment \(unit) is being deInit")
    }
}

var john: NewPerson?
var unit4A: Apartment?

john = NewPerson(name: "John MacIntosh")
unit4A = Apartment(unit: "4A")
john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil
// deInit is not called since there still is a reference between the two instances

class Customer {
    let name: String
    var card: CreditCard?
    init(name:String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deInit")
    }
}

class CreditCard{
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deInit")
    }
}


var gregg: Customer?
gregg = Customer(name: "Gregg Peters")
gregg!.card = CreditCard(number: 1234_4567_4545_4545, customer: gregg!)

gregg = nil



class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self]  in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        }
        else {
            return "<\(self.name)>"
        }
    }
    
    init(name:String, text:String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deINIT")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "Some deafult text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}

print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello world")
print(paragraph!.asHTML())
paragraph = nil














