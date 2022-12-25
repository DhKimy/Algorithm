import Foundation

func solution(_ n:Int) -> Int {
	let flipToThree = String(n,radix: 3)
    let answer = Int(String(flipToThree.reversed()),radix:3)!
    return answer
}