import UIKit

var str = "Hello, playground"

var text: String = "28100009555SPLMKEMADR00100065Kemadrin                      tabletter           TAB           5 mg                0000005000MG 267266272482 N04AA04OR               D           "
var text2: String = "2810011515520020205NOVALGIN VET."


let index = text.index(text.startIndex, offsetBy: 29)
let characterIndex2 = text.index(text.startIndex, offsetBy: 59)


let lastChar2 = text[index..<characterIndex2]

var index1 = text2.endIndex
print(index1.encodedOffset)

