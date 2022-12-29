//
//  main.swift
//  병합 정렬
//
//  Created by 강민수 on 2022/12/21.
//

import Foundation

// 배열 기반 병합 정렬 알고리즘
// 순서 : 1. 분리 -> 2. 정복 -> 3. 결합

public func mergeSort<T: Comparable>(_ list: [T]) -> [T] {
    //2이상이어야 나눠서 정렬을 할 수 있기 때문
    if list.count < 2{
        return list
    }
    
    let center = list.count / 2
    
    return merge(leftHalf: mergeSort([T] (list[0..<center])), rightHalf: mergeSort([T] (list[center..<list.count])))
}

private func merge<T: Comparable>(leftHalf: [T], rightHalf: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var tmpList = [T]()
    
    tmpList.reserveCapacity(leftHalf.count + rightHalf.count)
    
    while (leftIndex < leftHalf.count && rightIndex < rightHalf.count) {
        if leftHalf[leftIndex] < rightHalf[rightIndex] {
            tmpList.append(leftHalf[leftIndex])
            leftIndex += 1
        } else if leftHalf[leftIndex] > rightHalf[rightIndex] {
            tmpList.append(rightHalf[rightIndex])
            rightIndex += 1
        } else {
            tmpList.append(leftHalf[leftIndex])
            tmpList.append(rightHalf[rightIndex])
            
            leftIndex += 1
            rightIndex += 1
        }
    }
    
    tmpList += [T](leftHalf[leftIndex..<leftHalf.count])
    tmpList += [T](rightHalf[rightIndex..<rightHalf.count])
    
    return tmpList
}
        
print(mergeSort([2, 3, 4, 1]))
