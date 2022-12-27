func solution(_ a:Int, _ b:Int) -> String {
    let weekArray = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    let daysArray = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    var totalDay = b
    if a == 1 {
        return weekArray[abs(totalDay + 4) % 7]
    } else {
        for i in 0 ... a - 2 {
            totalDay += daysArray[i]
        }
    }
    return weekArray[(totalDay + 4) % 7]
}