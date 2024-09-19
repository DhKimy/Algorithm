import Foundation

func boj_15656() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1])
    let inputArr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

    var result = ""

    dfs(0, "")
    FileHandle.standardOutput.write(result.data(using: .utf8)!)
    
    func dfs(_ depth: Int, _ current: String) {
        if depth == m {
            result += current + "\n"
            return
        }

        for i in inputArr {
            dfs(depth + 1, current + "\(i) " )
        }
    }
}

boj_15656()