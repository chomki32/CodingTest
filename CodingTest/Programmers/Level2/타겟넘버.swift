//
//  타겟넘버.swift
//  CodingTest
//
//  Created by Lucid Dream mac mini on 2022/04/05.
//

import Foundation

class 타겟넘버 {
    func solution(_ numbers:[Int], _ target:Int) -> Int {
        return dfs(numbers: numbers, target: target, depth: 0)
//        return bfs(numbers: numbers, target: target)
    }
    
    func dfs(numbers: [Int], target: Int, depth: Int) -> Int {
        var numbers = numbers
        var count = 0
        if depth == numbers.count {
            return numbers.reduce(0, { $0 + $1 }) == target ? 1 : 0
        }
        
        count += dfs(numbers: numbers, target: target, depth: depth + 1)
        numbers[depth] *= -1
        count += dfs(numbers: numbers, target: target, depth: depth + 1)
        
        return count
    }
    
    func bfs(numbers: [Int], target: Int) -> Int {
        var tree: [Int] = [0]
        for number in numbers {
            var temp: [Int] = []
            for parent in tree {
                temp.append(parent + number)
                temp.append(parent - number)
            }
            tree = temp
        }
        return tree.filter({$0 == target}).count
    }
}

//dfs
//테스트 1 〉    통과 (2891.57ms, 16.4MB)
//테스트 2 〉    통과 (2858.88ms, 16.4MB)
//테스트 3 〉    통과 (2.55ms, 16.2MB)
//테스트 4 〉    통과 (6.84ms, 16.4MB)
//테스트 5 〉    통과 (65.72ms, 16.5MB)
//테스트 6 〉    통과 (2.99ms, 16.6MB)
//테스트 7 〉    통과 (2.43ms, 16.5MB)
//테스트 8 〉    통과 (16.63ms, 16.2MB)

//bfs
//테스트 1 〉    통과 (247.34ms, 27.2MB)
//테스트 2 〉    통과 (235.29ms, 27.2MB)
//테스트 3 〉    통과 (0.27ms, 16.3MB)
//테스트 4 〉    통과 (1.15ms, 16.5MB)
//테스트 5 〉    통과 (9.27ms, 16.3MB)
//테스트 6 〉    통과 (0.55ms, 16.5MB)
//테스트 7 〉    통과 (0.33ms, 16.2MB)
//테스트 8 〉    통과 (1.98ms, 16.5MB)
