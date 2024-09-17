    func boj_6593() {
        let dir: [(x: Int, y: Int, z: Int)] = [(-1, 0, 0), (1, 0, 0), (0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1)]

        while true {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            let (l, r, c) = (input[0], input[1], input[2])
            if input == [0, 0, 0] {
                break
            }

            var flag = true
            var queue = [(x: Int, y: Int, z: Int, count: Int)]()
            var graph = [[[Character]]]()
            var visited = [[[Bool]]](
                repeating: [[Bool]](
                    repeating: [Bool](
                        repeating: false,
                        count: c
                    ),
                    count: r
                ),
                count: l
            )

            var startPos = (x: 0, y: 0, z: 0, count: 0)

            for i in 0..<l {
                var tempGraph = [[Character]]()
                for j in 0..<r {
                    let input = readLine()!.map { $0 }
                    if input.contains("S") {
                        startPos.x = input.firstIndex(of: "S")!
                        startPos.y = j
                        startPos.z = i
                    }
                    tempGraph.append(input)
                }
                readLine()!
                graph.append(tempGraph)
            }

//            if input == [1, 1, 1] {
//                if graph[0][0][0] != "E" {
//                    print("Trapped!")
//                } else {
//                    print("Escaped in 0 minutes(s).")
//                }
//                continue
//            }

            queue.append(startPos)
            visited[startPos.z][startPos.y][startPos.x] = true

            while !queue.isEmpty {
                let first = queue.removeFirst()

                for i in dir {
                    let newX = first.x + i.x
                    let newY = first.y + i.y
                    let newZ = first.z + i.z

                    if newX >= 0 && newY >= 0 && newZ >= 0 && newX < c && newY < r && newZ < l {
                        if graph[newZ][newY][newX] == "E" {
                            print("Escaped in \(first.count + 1) minute(s).")
                            flag = false
                            break
                        } else if graph[newZ][newY][newX] == "." && !visited[newZ][newY][newX] {
                            queue.append((newX, newY, newZ, first.count + 1))
                            visited[newZ][newY][newX] = true
                        }
                    }
                }

                if !flag { break }
            }

            if flag { print("Trapped!") }
        }
    }

boj_6593()