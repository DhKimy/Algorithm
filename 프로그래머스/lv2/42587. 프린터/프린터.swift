import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priorArray = Array(priorities.reversed())
    var charcterArray = Array(repeatElement("C", count: priorities.count))
    charcterArray[location] = "Target"
    var reverseCharArray = Array(charcterArray.reversed())

    var i = 0
    while true {
        if priorArray.last == priorArray.max() {
            i += 1
            if reverseCharArray.last == "Target" {
                break
            }
            priorArray.removeLast()
            reverseCharArray.removeLast()
            
        } else {
            priorArray.insert(priorArray.popLast()!, at: 0)
            reverseCharArray.insert(reverseCharArray.popLast()!, at: 0)
        }
    }
    return i
}