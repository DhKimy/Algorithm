import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var waitingTrucks = Array(repeating: 0, count: bridge_length)
    var crossingTrucks = truck_weights
    var wholeTime = 0
    var bridgeWeight = 0
    
    while !waitingTrucks.isEmpty {
        wholeTime += 1
        bridgeWeight -= waitingTrucks.removeFirst()
        if let i = crossingTrucks.first {
            if i + bridgeWeight <= weight {
                bridgeWeight += crossingTrucks.removeFirst()
                waitingTrucks.append(i)
            } else {
                waitingTrucks.append(0)
            }
        }
    }
    return wholeTime
}