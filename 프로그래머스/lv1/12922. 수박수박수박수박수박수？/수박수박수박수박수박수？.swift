func solution(_ n:Int) -> String {
    return String((1 ... n).map({ $0 % 2 != 0 ? "수" : "박" }))
}