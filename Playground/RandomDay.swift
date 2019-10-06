import UIKit

let day = arc4random_uniform(UInt32(60))+1


let today = Date(timeIntervalSinceNow: 0)
let gregorian  = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
var offsetComponents = DateComponents()
offsetComponents.day = Int(day - 1)


let randomDate = gregorian?.date(byAdding: offsetComponents, to: today, options: .init(rawValue: 0) )

