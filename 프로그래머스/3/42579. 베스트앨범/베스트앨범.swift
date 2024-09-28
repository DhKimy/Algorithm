import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genrePlayCount = [String: Int]()
    var songsByGenre = [String: [(idx: Int, cnt: Int)]]()

    for i in 0..<genres.count {
        let genre = genres[i]
        let play = plays[i]

        genrePlayCount[genre, default: 0] += play

        songsByGenre[genre, default: []].append((i, play))
    }

    let sortedGenres = genrePlayCount.sorted { $0.value > $1.value }

    var answer = [Int]()

    for (genre, _) in sortedGenres {
        let sortedSongs = songsByGenre[genre]!.sorted {
            if $0.cnt == $1.cnt {
                return $0.idx < $1.idx
            } else {
                return $0.cnt > $1.cnt
            }
        }

        answer.append(sortedSongs[0].idx)
        if sortedSongs.count > 1 {
            answer.append(sortedSongs[1].idx)
        }
    }

    return answer
}