//
//  뉴스클러스터링.swift
//  CodingTest
//
//  Created by Lucid Dream mac mini on 2022/04/13.
//

import Foundation

class 뉴스클러스터링 {
    func solution(_ str1: String, _ str2: String) -> Int {
        let constant: Float = 65536
        let set1: [String] = makeSet(string: str1)
        let set2: [String] = makeSet(string: str2)
        
        let intersection: [String] = getIntersection(set1, set2)
        let union: [String] = getUnion(set1, set2)
        
        if intersection.count == 0 && union.count == 0 {
            return Int(constant)
        }
        
        return Int(constant * Float(intersection.count) / Float(union.count))
    }
    
    private func makeSet(string: String) -> [String] {
        let str = string.lowercased()
        var set: [String] = []
        guard !str.isEmpty else { return set }
        
        for i in 0 ..< str.count - 1 {
            let temp = str.substring(from: i, length: 2).filter({$0.isASCII && $0.isLetter})
            
            if temp.count == 2 {
                set.append(str.substring(from: i, length: 2))
            }
        }
        
        return set
    }
    
    private func getIntersection(_ set1: [String], _ set2: [String]) -> [String] {
        var set2 = set2
        var result: [String] = []
        for str1 in set1 {
            for i in 0 ..< set2.count {
                if str1 == set2[i] {
                    result.append(set2.remove(at: i))
                    break
                }
            }
        }
        
        return result
    }
    
    private func getUnion(_ set1: [String], _ set2: [String]) -> [String] {
        var set2 = set2
        var result: [String] = []
        for str1 in set1 {
            result.append(str1)
            for i in 0 ..< set2.count {
                if str1 == set2[i] {
                    set2.remove(at: i)
                    break
                }
            }
        }
        
        result.append(contentsOf: set2)
        
        return result
    }
}

//테스트 1 〉    통과 (0.15ms, 16.7MB)
//테스트 2 〉    통과 (0.21ms, 16.6MB)
//테스트 3 〉    통과 (0.13ms, 16.6MB)
//테스트 4 〉    통과 (120.33ms, 16.8MB)
//테스트 5 〉    통과 (0.24ms, 16.9MB)
//테스트 6 〉    통과 (0.14ms, 16.7MB)
//테스트 7 〉    통과 (0.94ms, 16.4MB)
//테스트 8 〉    통과 (0.15ms, 16.4MB)
//테스트 9 〉    통과 (0.85ms, 16.8MB)
//테스트 10 〉    통과 (2.79ms, 16.6MB)
//테스트 11 〉    통과 (12.68ms, 16.9MB)
//테스트 12 〉    통과 (0.13ms, 16.7MB)
//테스트 13 〉    통과 (0.38ms, 16.8MB)
