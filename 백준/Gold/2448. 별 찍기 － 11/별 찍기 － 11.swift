let input = Int(readLine()!)!

var array = [
  "  *   ",
  " * *  ",
  "***** "]

var num = 3
while num < input {
  let count = array.count

  var temp: [String] = []

  for a in array {
    temp.append(a + a)
  }

  for i in 0 ..< count {
    var str = array[i]
    str = String(repeating: " ", count: count) + str + String(repeating: " ", count: count)
    array[i] = str
  }

  array.append(contentsOf: temp)
  num *= 2
}

for s in array {
  print(s)
}