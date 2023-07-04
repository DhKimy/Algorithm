let testCount = Int(readLine()!)!

for _ in 0 ..< testCount {
    var answer = 0
    let size = readLine()!.split(separator: " ").compactMap { Int($0) }
    let aElement = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted(by: >)
    let bElement = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted(by: >)
    
    for i in aElement {
        // 만약, 정렬된
        for (index, j) in bElement.enumerated() {
            if i > j {
                answer += (size[1] - index)
                break
            } else if i <= j {
                continue
            }
        }
    }
    
    print(answer)
    answer = 0
}