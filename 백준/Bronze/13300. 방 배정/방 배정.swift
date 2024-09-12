func boj_13300() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (input[0], input[1])
    var girls = [[Int]]()
    var boys = [[Int]]()
    var room = [[Int]]()
    var answer = 0

    for _ in 0..<n {
        let student = readLine()!.split(separator: " ").map { Int($0)! }
        if student[0] == 0 {
            girls.append(student)
        } else {
            boys.append(student)
        }
    }

    girls.sort(by: { $0[1] > $1[1] })
    boys.sort(by: { $0[1] > $1[1] })

    for girl in girls {
        if room.isEmpty {
            room.append([girl[1], 1])
            continue
        }

        var roomInfo = room.last!
        if roomInfo[0] == girl[1] && roomInfo[1] + 1 <= k {
            roomInfo[1] += 1
            room.removeLast()
            room.append(roomInfo)
        } else {
            room.append([girl[1], 1])
        }
    }

    answer += room.count
    room = [[Int]]()

    for boy in boys {
        if room.isEmpty {
            room.append([boy[1], 1])
            continue
        }

        var roomInfo = room.last!
        if roomInfo[0] == boy[1] && roomInfo[1] + 1 <= k {
            roomInfo[1] += 1
            room.removeLast()
            room.append(roomInfo)
        } else {
            room.append([boy[1], 1])
        }
    }

    answer += room.count
    room = [[Int]]()

    print(answer)
}

boj_13300()