//
//  멀쩡한사각형.swift
//  CodingTest
//
//  Created by Lucid Dream mac mini on 2022/04/05.
//

import Foundation

class 멀쩡한사각형 {
    func solution(_ w:Int, _ h:Int) -> Int64 {
        let gcd = calculateGCD(max(w, h), min(w, h))
        let broken = w + h - gcd
        return Int64(w * h - broken)
    }
    
    private func calculateGCD(_ a: Int, _ b: Int) -> Int {
        let remainder = a % b
        if remainder == 0 {
            return b
        } else {
            return calculateGCD(b, remainder)
        }
    }
}

//테스트 1 〉    통과 (0.01ms, 16.3MB)
//테스트 2 〉    통과 (0.01ms, 16.5MB)
//테스트 3 〉    통과 (0.01ms, 16.1MB)
//테스트 4 〉    통과 (0.02ms, 16.2MB)
//테스트 5 〉    통과 (0.01ms, 16.4MB)
//테스트 6 〉    통과 (0.01ms, 16.3MB)
//테스트 7 〉    통과 (0.01ms, 16.3MB)
//테스트 8 〉    통과 (0.01ms, 16.5MB)
//테스트 9 〉    통과 (0.01ms, 16.5MB)
//테스트 10 〉    통과 (0.01ms, 16.4MB)
//테스트 11 〉    통과 (0.01ms, 16.2MB)
//테스트 12 〉    통과 (0.02ms, 16.2MB)
//테스트 13 〉    통과 (0.01ms, 16.5MB)
//테스트 14 〉    통과 (0.01ms, 16.4MB)
//테스트 15 〉    통과 (0.01ms, 16.4MB)
//테스트 16 〉    통과 (0.01ms, 16.5MB)
//테스트 17 〉    통과 (0.02ms, 16.3MB)
//테스트 18 〉    통과 (0.01ms, 16.2MB)
