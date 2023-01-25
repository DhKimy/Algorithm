import Foundation

func solution(_ numbers:[Int]) -> String {
    return numbers.sorted(by: {
            let temp1 = String($0)
            let temp2 = String($1)
            return temp1 + temp2 > temp2 + temp1
        }).reduce(""){
            $0 != "0" ? $0 + String($1) : String($1)
        }
}