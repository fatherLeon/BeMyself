import Foundation


// MARK: - 1
//import Foundation
//
//func solution(_ wallpaper:[String]) -> [Int] {
//    var xResults: [Int] = []
//    var yResults: [Int] = []
//
//    for y in 0..<wallpaper.count {
//        let paper = Array(wallpaper[y]).map { String($0) }
//
//        for x in 0..<paper.count {
//            if paper[x] == "#" {
//                yResults.append(y)
//                xResults.append(x)
//            }
//        }
//    }
//
//    return [yResults.min()!, xResults.min()!, yResults.max()! + 1, xResults.max()! + 1]
//}


func solution(_ wallpaper:[String]) -> [Int] {
    var xResults: [Int] = []
    var yResults: [Int] = []
    
    for y in 0..<wallpaper.count {
        guard let minX = wallpaper[y].firstIndex(of: "#"),
              let maxX = wallpaper[y].lastIndex(of: "#") else { continue }
        
        let minDistance = wallpaper[y].distance(from: wallpaper[y].startIndex,
                                                to: minX)
        let maxDistance = wallpaper[y].distance(from: wallpaper[y].startIndex,
                                                to: maxX)
        
        yResults.append(y)
        xResults.append(minDistance)
        xResults.append(maxDistance)
    }
    
    return [yResults.min()!, xResults.min()!, yResults.max()! + 1, xResults.max()! + 1]
}

solution([".#...", "..#..", "...#."])
solution(["..........", ".....#....", "......##..", "...##.....", "....#....."])
solution(["..", "#."])
solution([".##...##.", "#..#.#..#", "#...#...#", ".#.....#.", "..#...#..", "...#.#...", "....#...."])
