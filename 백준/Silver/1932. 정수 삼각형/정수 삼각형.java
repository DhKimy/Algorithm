import java.util.*;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = Integer.parseInt(sc.nextLine());
        int[][] arr = new int[n][];
        int[][] dp = new int[n][n];

        for (int i = 0; i < n; i++) {
            String[] input = sc.nextLine().split(" ");
            arr[i] = new int[input.length];
            for (int j = 0; j < input.length; j++) {
                arr[i][j] = Integer.parseInt(input[j]);
            }
        }

        // dp 배열을 -1로 초기화
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                dp[i][j] = -1;
            }
        }

        System.out.println(dynamicProgram(0, 0, n, arr, dp));
    }

    private static int dynamicProgram(int idx, int depth, int n, int[][] arr, int[][] dp) {
        // 기저 조건: 마지막 줄에 도달했을 때 해당 요소의 값을 반환
        if (depth == n - 1) {
            return arr[depth][idx];
        }

        // 이미 계산된 값이 있다면 바로 반환
        if (dp[depth][idx] != -1) {
            return dp[depth][idx];
        }

        // 다음 줄에서의 최대 합 계산
        int left = dynamicProgram(idx, depth + 1, n, arr, dp);
        int right = dynamicProgram(idx + 1, depth + 1, n, arr, dp);
        // 현재 depth, idx에서의 최대 합 계산
        dp[depth][idx] = arr[depth][idx] + Math.max(left, right);

        return dp[depth][idx];
    }
}