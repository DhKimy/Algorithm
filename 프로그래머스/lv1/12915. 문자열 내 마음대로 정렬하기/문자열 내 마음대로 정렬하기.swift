func solution(_ strings:[String], _ n:Int) -> [String] {
    var arrayStrings = strings
    return arrayStrings.sorted().sorted(by: { sortAESC($0, $1, n) })
}

func sortAESC(_ num1: String, _ num2: String, _ n: Int) -> Bool {
   return Array(num1)[n] < Array(num2)[n]
}