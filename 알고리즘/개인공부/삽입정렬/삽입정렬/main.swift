//
//  main.swift
//  삽입정렬
//
//  Created by 강민수 on 2022/12/21.
//

import Foundation

public func insertionSort<T: Comparable>(_ list: inout [T]) {
    if list.count <= 1 {
        return
    }
    
    for i in 1..<list.count {
        let x = list[i]
        var nowIndex = i
        
        while nowIndex > 0 && list[nowIndex - 1] > x {
            list[nowIndex] = list[nowIndex - 1]
            nowIndex -= 1
        }
        list[nowIndex] = x
                
    }
}

var x = [3, 2, 1]

insertionSort(&x)

print(x)
