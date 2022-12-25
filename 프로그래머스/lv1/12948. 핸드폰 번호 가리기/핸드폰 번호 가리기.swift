func solution(_ phone_number:String) -> String {
    if phone_number.count == 4 {
        return phone_number
    }
    var numbers = Array(phone_number)
    for i in 0 ... numbers.count - 5 {
        numbers[i] = "*"
    }
    return String(numbers)
}