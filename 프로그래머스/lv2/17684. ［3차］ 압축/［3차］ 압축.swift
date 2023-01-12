func solution(_ msg:String) -> [Int] {
    var answer = [Int]()
    let innerMsg = msg.compactMap({ String($0) })
    var dict = [String : Int]()
    for i in 1 ... 26 {
        dict[String(UnicodeScalar(i + 64)!)] = i
    }
    
    var i = 0
    var w = ""
    while i < innerMsg.count {
        let c = innerMsg[i]
        let tempWC = w + c
            
        if !checkInDict(w, c, dict) {
            dict[tempWC] = dict.count + 1
            answer.append(dict[w]!)
            w = ""
            continue
        }
        w += c
        i += 1
    }
    answer.append(dict[w]!)
    return answer
}

func checkInDict(_ w: String, _ c: String, _ dict: [String : Int]) -> Bool {
    let wc = w + c
    let isInDict = dict.contains(where: { $0.key == wc })
    return isInDict
}