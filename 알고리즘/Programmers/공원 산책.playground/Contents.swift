import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var parks = park.map { return Array($0).map { String($0) } }

    var locationX = Int(parks.firstIndex(where: { value in
        if value.contains("S") {
            return true
        }
        return false
    })!)
    var locationY = Int(parks[locationX].firstIndex(of: "S")!)
    
    let maxX = parks.count - 1
    let maxY = parks[0].count - 1
    
    for route in routes {
        let myRoute = route.split(separator: " ").map { String($0) }

        switch myRoute[0] {
        case "N":
            if locationX - Int(myRoute[1])! < 0 {
                break
            }
            
            for x in 1...Int(myRoute[1])! {
                var coordinateX = locationX - x
                
                if parks[coordinateX][locationY] == "X" {
                    break
                }
                
                if coordinateX == locationX - Int(myRoute[1])! {
                    locationX = coordinateX
                }
            }
        case "S":
            if locationX + Int(myRoute[1])! > maxX {
                break
            }
            
            for x in 1...Int(myRoute[1])! {
                var coordinateX = locationX + x
                
                if parks[coordinateX][locationY] == "X" {
                    break
                }
                
                if coordinateX == locationX + Int(myRoute[1])! {
                    locationX = coordinateX
                }
            }
        case "W":
            if locationY - Int(myRoute[1])! < 0 {
                break
            }
            
            for x in 1...Int(myRoute[1])! {
                var coordinateY = locationY - x
                
                if parks[locationX][coordinateY] == "X" {
                    break
                }
                
                if coordinateY == locationY - Int(myRoute[1])! {
                    locationY = coordinateY
                }
            }
        case "E":
            if locationY + Int(myRoute[1])! > maxY {
                break
            }
            
            for x in 1...Int(myRoute[1])! {
                var coordinateY = locationY + x
                
                if parks[locationX][coordinateY] == "X" {
                    break
                }
                
                if coordinateY == locationY + Int(myRoute[1])! {
                    locationY = coordinateY
                }
            }
        default:
            break
        }
        
        print(locationX, locationY)
    }

    return [locationX, locationY]
}

solution(["OSO","OOO","OXO","OOO"], ["E 2","S 3","W 1"])


