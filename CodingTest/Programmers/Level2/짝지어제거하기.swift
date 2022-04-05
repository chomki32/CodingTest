//
//  짝지어제거하기.swift
//  CodingTest
//
//  Created by 조민기 on 2022/04/05.
//

import Foundation

class 짝지어제거하기 {
    func solution(_ s: String) -> Int {
        var stack = [String.Element]()
        let elements = Array(s)
        
        for i in elements.indices {
            if stack.last == elements[i] {
                stack.removeLast()
            } else {
                stack.append(elements[i])
            }
        }
        
        return stack.isEmpty ? 1 : 0
    }
}

//정확성  테스트
//테스트 1 〉    통과 (0.04ms, 16.4MB)
//테스트 2 〉    통과 (37.00ms, 16.8MB)
//테스트 3 〉    통과 (38.77ms, 17.5MB)
//테스트 4 〉    통과 (47.28ms, 18.2MB)
//테스트 5 〉    통과 (39.07ms, 18MB)
//테스트 6 〉    통과 (41.26ms, 18.1MB)
//테스트 7 〉    통과 (41.38ms, 17.8MB)
//테스트 8 〉    통과 (41.07ms, 18.2MB)
//테스트 9 〉    통과 (0.03ms, 16.5MB)
//테스트 10 〉    통과 (0.09ms, 16.5MB)
//테스트 11 〉    통과 (0.04ms, 16.4MB)
//테스트 12 〉    통과 (0.04ms, 16.4MB)
//테스트 13 〉    통과 (0.04ms, 16.5MB)
//효율성  테스트
//테스트 1 〉    통과 (409.85ms, 40.5MB)
//테스트 2 〉    통과 (364.92ms, 31.2MB)
//테스트 3 〉    통과 (401.42ms, 36.3MB)
//테스트 4 〉    통과 (431.94ms, 36.2MB)
//테스트 5 〉    통과 (399.94ms, 36.3MB)
//테스트 6 〉    통과 (415.50ms, 36.4MB)
//테스트 7 〉    통과 (412.28ms, 36.4MB)
//테스트 8 〉    통과 (414.91ms, 40.2MB)

// 효율성 통과가 관건!
// Array 사용 중요.
// for element in elements --> for i in elements.indices 가 성능이 좋다.
