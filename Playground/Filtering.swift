import UIKit

let list = ["banana", "apple", "banana"]

list.filter {
    $0 != "banana"
}

let uniqueList: [String] = {
    var result = [String]()
    for item in list {
        if result.contains(item) == false {
            result.append(item)
        }
    }
    return result
}()

print(uniqueList)

print(list)


let numbers = [1, 5, 10]

numbers.max()
