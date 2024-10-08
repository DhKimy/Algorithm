struct Position {
    let x: Int
    let y: Int
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

var city = [[Int]]()
for _ in 0..<n {
    city.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var houses = [Position]()
var chickenShops = [Position]()

for i in 0..<n {
    for j in 0..<n {
        if city[i][j] == 1 {
            houses.append(Position(x: i, y: j))  // 집의 위치
        } else if city[i][j] == 2 {
            chickenShops.append(Position(x: i, y: j))  // 치킨집 위치
        }
    }
}

func calculateChickenDistance(selectedShops: [Position]) -> Int {
    var totalDistance = 0

    for house in houses {
        var minDistance = Int.max
        for shop in selectedShops {
            let distance = abs(house.x - shop.x) + abs(house.y - shop.y)
            minDistance = min(minDistance, distance)
        }
        totalDistance += minDistance
    }

    return totalDistance
}

func combinations<T>(_ array: [T], _ select: Int) -> [[T]] {
    if select == 0 {
        return [[]]
    }
    
    guard let first = array.first else { return [] }
    let head = [first]
    let subcombs = combinations(Array(array.dropFirst()), select - 1)
    var result = subcombs.map { head + $0 }
    result += combinations(Array(array.dropFirst()), select)
    
    return result
}

var minChickenDistance = Int.max
let chickenCombinations = combinations(chickenShops, m)

for selectedShops in chickenCombinations {
    let distance = calculateChickenDistance(selectedShops: selectedShops)
    minChickenDistance = min(minChickenDistance, distance)
}

print(minChickenDistance)