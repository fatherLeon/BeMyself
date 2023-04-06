import Foundation

func calculateNextNumber(_ n: Int) -> Int {
    if n % 2 == 0 {
        return n / 2
    } else {
        return (n + 1) / 2
    }
}

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var aParticipant = a
    var bParticipant = b
    var result = 0
    
    repeat {
        aParticipant = calculateNextNumber(aParticipant)
        bParticipant = calculateNextNumber(bParticipant)
        
        result += 1
    } while aParticipant != bParticipant
    
    return result
}

solution(8, 4, 7)
solution(100, 1, 99)
solution(8, 4, 5) // 3
solution(2, 1, 2) // 1
