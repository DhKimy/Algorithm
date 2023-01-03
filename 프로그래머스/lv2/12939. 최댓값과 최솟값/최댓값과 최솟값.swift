func solution(_ s:String) -> String {
    var array = s.components(separatedBy: " ").compactMap({ Int($0) })
    return "\(array.min()!) \(array.max()!)"
}