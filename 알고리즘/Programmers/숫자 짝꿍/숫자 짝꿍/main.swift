//참고 - https://velog.io/@sangwoo24/Programmers-숫자-짝궁.swift
import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var list: [String] = []
    
    for i in (0..<10) {
        let xCount = X.filter { String($0) == String(i) }.count
        let yCount = Y.filter { String($0) == String(i) }.count
        list += Array(repeating: String(i), count: min(xCount, yCount))
    }
    
    return list.isEmpty ? "-1" : list.filter { $0 == "0" }.count == list.count ? "0" : list.sorted(by: >).joined()
}
