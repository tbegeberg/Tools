import UIKit

var array = [111, 5, 2, 3, 10]

for i in 0..<array.count {
  for j in 1..<array.count {
    if array[j] < array[j-1] {
      let tmp = array[j-1]
      array[j-1] = array[j]
      array[j] = tmp
    }
  }
}

print(array)

var secondArray = [111, 5, 2, 3, 10]

func mergesort(array: inout [Int]) {
    if array.count > 1 {
        let middleIndex = array.count/2
           var leftArray: [Int] = Array(array[0..<middleIndex])
           var rightArray: [Int] = Array(array[middleIndex..<array.count])
           
           mergesort(array: &leftArray)
           mergesort(array: &rightArray)
           
           var i = 0
           var j = 0
           var k = 0
           
           while i < leftArray.count && j < rightArray.count {
               if leftArray[i] < rightArray[j] {
                   array[k] = leftArray[i]
                   i += 1
               } else {
                   array[k] = rightArray[j]
                   j += 1
               }
               k += 1
           }
           
           while i < leftArray.count {
               array[k] = leftArray[i]
               i += 1
               k += 1
           }
           
           while j < rightArray.count {
               array[k] = rightArray[j]
               j += 1
               k += 1
           }
    }
    print(array)
}

mergesort(array: &secondArray)
