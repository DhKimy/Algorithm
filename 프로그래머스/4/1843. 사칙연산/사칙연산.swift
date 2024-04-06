import Foundation

var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 2), count: 101), count: 101)
let INF = 9_000_000_000
var expressionArray = [String]()

func calculate(_ left: Int, _ right: Int, _ isPositive: Int) -> Int {

    // 결과 값을 저장할 변수
    var result = dp[left][right][isPositive]

    // 이미 계산된 결과가 있는 경우 반환합니다.
    if result != -1 {
        return result
    }

    // 표현식의 부호가 양수인 경우
    if isPositive == 1 {

        result = -INF

        // 표현식을 탐색하면서 최댓값을 계산
        for i in left...right {
            // 왼쪽 값 및 오른쪽 값 계산
            var leftValue: Int, rightValue: Int
            // 왼쪽 값 계산 (인덱스가 범위를 벗어난 경우 해당 값으로 초기화)
            leftValue = left > i - 1 ? Int(expressionArray[2 * left])! : calculate(left, i - 1, 1)
            // 오른쪽 값 계산 (인덱스가 범위를 벗어난 경우 해당 값으로 초기화)
            if i + 1 > right {
                rightValue = Int(expressionArray[2 * right + 2])!
            } else if expressionArray[2 * i + 1] == "+" {
                rightValue = calculate(i + 1, right, 1)
            } else {
                rightValue = calculate(i + 1, right, 0)
            }

            // 표현식의 부호에 따라 계산
            if expressionArray[2 * i + 1] == "+" {
                result = max(leftValue + rightValue, result)
            } else {
                result = max(leftValue - rightValue, result)
            }
        }
    } else { // 표현식의 부호가 음수인 경우

        // 초기 값 설정
        result = INF
        // 표현식을 탐색하면서 최솟값을 계산합니다.
        for i in left...right {

            // 왼쪽 값 및 오른쪽 값 계산
            var leftValue: Int, rightValue: Int

            // 왼쪽 값 계산 (인덱스가 범위를 벗어난 경우 해당 값으로 초기화)
            leftValue = left > i - 1 ? Int(expressionArray[2 * left])! : calculate(left, i - 1, 0)

            // 오른쪽 값 계산 (인덱스가 범위를 벗어난 경우 해당 값으로 초기화)
            if i + 1 > right {
                rightValue = Int(expressionArray[2 * right + 2])!
            } else if expressionArray[2 * i + 1] == "+" {
                rightValue = calculate(i + 1, right, 0)
            } else {
                rightValue = calculate(i + 1, right, 1)
            }

            // 표현식의 부호에 따라 계산
            if expressionArray[2 * i + 1] == "+" {
                result = min(leftValue + rightValue, result)
            } else {
                result = min(leftValue - rightValue, result)
            }
        }
    }

    // 계산 결과를 dp 배열에 저장하고 반환
    dp[left][right][isPositive] = result
    return result
}

func solution(_ input_array:[String]) -> Int
{
    // dp 배열을 초기화하고 표현식 배열을 설정
    dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 2), count: 101), count: 101)
    expressionArray = input_array
    // 표현식을 계산하고 결과를 반환
    return calculate(0, input_array.count / 2 - 1, 1)

}