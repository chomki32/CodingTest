//
//  문자열압축.swift
//  CodingTest
//
//  Created by Lucid Dream mac mini on 2022/04/05.
//

import Foundation

class 문자열압축 {
    func solution(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        
        let maxCompressionLength: Int = s.count / 2
        var minimumLength: Int = s.count
        
        for length in (1 ... maxCompressionLength) {
            let components = split(string: s, length: length)
            var index = 0
            var compressed = ""
            
            while index < components.count {
                var equalCount = 0
                for m in (index + 1 ..< components.count) {
                    if components[index] == components[m] {
                        equalCount += 1
                    } else {
                        break
                    }
                }
                
                compressed += (equalCount > 0 ? "\(equalCount + 1)" : "") + components[index]
                index += equalCount + 1
            }
            
            if minimumLength > compressed.count {
                minimumLength = compressed.count
            }
        }
        
        return minimumLength
    }
    
    private func split(string: String, length: Int) -> [String] {
        var splitArr: [String] = []
        for i in stride(from: 0, to: string.count, by: length) {
            splitArr.append(substring(string: string, from: i, length: length))
        }
        return splitArr
    }
    
    private func substring(string: String, from: Int, length: Int) -> String {
        guard from < string.count else { return "" }
        let startIndex: String.Index = {
            string.index(string.startIndex, offsetBy: from)
        }()
        let endIndex: String.Index = {
            if from + length - 1 < string.count {
                return string.index(string.startIndex, offsetBy: from + length)
            } else {
                return string.index(string.startIndex, offsetBy: string.count)
            }
        }()
        return String(string[startIndex ..< endIndex])
    }
}

//테스트 1 〉    통과 (0.15ms, 16.3MB)
//테스트 2 〉    통과 (10.02ms, 16.4MB)
//테스트 3 〉    통과 (2.96ms, 16.4MB)
//테스트 4 〉    통과 (0.15ms, 16.3MB)
//테스트 5 〉    통과 (0.01ms, 16.2MB)
//테스트 6 〉    통과 (0.23ms, 16.2MB)
//테스트 7 〉    통과 (12.11ms, 16.4MB)
//테스트 8 〉    통과 (25.80ms, 16.4MB)
//테스트 9 〉    통과 (22.46ms, 16.4MB)
//테스트 10 〉    통과 (254.52ms, 16.5MB)
//테스트 11 〉    통과 (0.74ms, 16.4MB)
//테스트 12 〉    통과 (0.77ms, 16.5MB)
//테스트 13 〉    통과 (1.04ms, 16.5MB)
//테스트 14 〉    통과 (21.54ms, 16.4MB)
//테스트 15 〉    통과 (1.99ms, 16.3MB)
//테스트 16 〉    통과 (0.07ms, 16.2MB)
//테스트 17 〉    통과 (61.76ms, 16.4MB)
//테스트 18 〉    통과 (63.80ms, 16.6MB)
//테스트 19 〉    통과 (66.19ms, 16.5MB)
//테스트 20 〉    통과 (318.88ms, 16.4MB)
//테스트 21 〉    통과 (301.19ms, 16.6MB)
//테스트 22 〉    통과 (299.82ms, 16.4MB)
//테스트 23 〉    통과 (259.73ms, 16.4MB)
//테스트 24 〉    통과 (318.70ms, 16.4MB)
//테스트 25 〉    통과 (272.66ms, 16.2MB)
//테스트 26 〉    통과 (274.70ms, 16.6MB)
//테스트 27 〉    통과 (273.82ms, 16.4MB)
//테스트 28 〉    통과 (0.07ms, 16.4MB)
