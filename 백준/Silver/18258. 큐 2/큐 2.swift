import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> Int {
        var str = 0
        var now = read()

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
                && now != 32 && now != 0 {
            str += Int(now)
            now = read()
        }

        return str
    }
}

func boj_18258() {
    let file = FileIO()
    let n = file.readInt()
    var queue = [Int]()
    var size = 0
    var head = 0
    var answer = ""

    for _ in 0..<n {
        let input = file.readString()

        switch input {
        case 448: // "push"
            queue.append(file.readInt())
            size += 1
        case 335: // "pop"
            if size != 0 {
                answer += "\(queue[head])\n"
                head += 1
                size -= 1
            } else {
                answer += "-1\n"
            }
        case 443: // "size"
            answer += "\(size)\n"
        case 559: // "empty"
            answer += size == 0 ? "1\n" : "0\n"
        case 553: // "front"
            if size == 0 {
                answer += "-1\n"
            } else {
                answer += "\(queue[head])\n"
            }
        case 401: // "back"
            if size == 0 {
                answer += "-1\n"
            } else {
                answer += "\(queue.last!)\n"
            }
        default:
            break
        }
    }

    print(answer)
}

boj_18258()