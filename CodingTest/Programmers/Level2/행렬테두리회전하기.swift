//
//  행렬테두리회전하기.swift
//  CodingTest
//
//  Created by Lucid Dream mac mini on 2022/04/06.
//

import Foundation

class 행렬테두리회전하기 {
    func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
        var matrix: [[Int]] = []
        
        for row in (1 ... rows) {
            matrix.append([])
            for col in (1 ... columns) {
                matrix[row - 1].append(col + ((row - 1) * columns))
            }
        }
        
        var minimumNumebr: [Int] = []
        for query in queries {
            let start: (row: Int, col: Int) = (query[0], query[1])
            let end: (row: Int, col: Int) = (query[2], query[3])
            var movedNumbers: [Int] = []
            var temp = 0
            var next = matrix[start.row - 1][start.col - 1]
            
            for col in start.col ... end.col {
                temp = matrix[start.row - 1][col - 1]
                matrix[start.row - 1][col - 1] = next
                next = temp
                movedNumbers.append(temp)
            }
            for row in start.row + 1 ... end.row {
                temp = matrix[row - 1][end.col - 1]
                matrix[row - 1][end.col - 1] = next
                next = temp
                movedNumbers.append(temp)
            }
            for col in (start.col ... end.col - 1).reversed() {
                temp = matrix[end.row - 1][col - 1]
                matrix[end.row - 1][col - 1] = next
                next = temp
                movedNumbers.append(temp)
            }
            for row in (start.row ... end.row - 1).reversed() {
                temp = matrix[row - 1][start.col - 1]
                matrix[row - 1][start.col - 1] = next
                next = temp
                movedNumbers.append(temp)
            }
            minimumNumebr.append(movedNumbers.sorted(by: <).first!)
        }
        
        return minimumNumebr
    }
}
