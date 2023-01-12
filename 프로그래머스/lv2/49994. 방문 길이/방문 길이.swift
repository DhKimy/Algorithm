func solution(_ dirs:String) -> Int {
    var curCoordinate = (0, 0)
    var visit = Set<String>()
    dirs.forEach({
        move(&curCoordinate, "\($0)", &visit)
    })
    return visit.count / 2
}

func move(_ cur: inout (Int, Int), _ direction: String, _ visit: inout Set<String>) {
    var temp = cur
    switch direction {
    case "U":
        temp = (cur.0, cur.1 + 1)
    case "D":
        temp = (cur.0, cur.1 - 1)
    case "R":
        temp = (cur.0 + 1, cur.1)
    default:
        temp = (cur.0 - 1, cur.1)
    }
    if -5 ... 5 ~= temp.0 && -5 ... 5 ~= temp.1 {
        visit.insert("\(cur)\(temp)")
        visit.insert("\(temp)\(cur)")
        cur = temp
    }
}