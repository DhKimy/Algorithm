import Foundation

func solution(_ word:String) -> Int {
    let alpha = ["A", "E", "I", "O", "U"]
    var dict = [String]()

    var temp = [String](repeating: "", count: 5)
    for i in 0..<5 {
        temp[0] = alpha[i]
        dict.append(temp.joined(separator: ""))
        for j in 0..<5 {
            temp[1] = alpha[j]
            dict.append(temp.joined(separator: ""))
            for k in 0..<5 {
                temp[2] = alpha[k]
                dict.append(temp.joined(separator: ""))
                for l in 0..<5 {
                    temp[3] = alpha[l]
                    dict.append(temp.joined(separator: ""))
                    for m in 0..<5 {
                        temp[4] = alpha[m]
                        dict.append(temp.joined(separator: ""))
                    }
                    temp[4] = ""
                }
                temp[3] = ""
            }
            temp[2] = ""
        }
        temp[1] = ""
    }

    return dict.firstIndex(of: word)! + 1
}