//
//  기능개발.swift
//  CodingTest
//
//  Created by Lucid Dream mac mini on 2022/04/05.
//

import Foundation

class 기능개발 {
    struct Progress {
        var progress: Int
        var speed: Int
        var remainDay: Int {
            let remain = ceil(Float(100 - progress) / Float(speed))
            return Int(remain)
        }
    }
    
    func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
        let progresses = zip(progresses, speeds).map({
            Progress(progress: $0, speed: $1)
        })
        var result: [Int] = []
        var prevRemainDay = 0
        
        for progress in progresses {
            if progress.remainDay > prevRemainDay {
                prevRemainDay = progress.remainDay
                result.append(1)
            } else {
                result[result.count - 1] += 1
            }
        }
        return result
    }
}

//테스트 1 〉    통과 (0.17ms, 16.7MB)
//테스트 2 〉    통과 (0.20ms, 16.5MB)
//테스트 3 〉    통과 (0.18ms, 16.6MB)
//테스트 4 〉    통과 (0.15ms, 16.5MB)
//테스트 5 〉    통과 (0.11ms, 16.5MB)
//테스트 6 〉    통과 (0.12ms, 16.4MB)
//테스트 7 〉    통과 (0.17ms, 16.5MB)
//테스트 8 〉    통과 (0.13ms, 16.7MB)
//테스트 9 〉    통과 (0.16ms, 16.6MB)
//테스트 10 〉    통과 (0.19ms, 16.3MB)
//테스트 11 〉    통과 (0.11ms, 16.6MB)
