//
//  행렬테두리회전하기.swift
//  CodingTest
//
//  Created by Lucid Dream mac mini on 2022/04/06.
//

import Foundation

class 행렬테두리회전하기 {
    func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
        var matrix: [[Int]] = getMatrix(rows: rows, columns: columns)
        var minimumNumebr: [Int] = []
        
        for query in queries {
            let start: (row: Int, col: Int) = (query[0], query[1])
            let end: (row: Int, col: Int) = (query[2], query[3])
            var movedNumbers: [Int] = []
            var next = matrix[start.row - 1][start.col - 1]
            
            for col in start.col ... end.col {
                next = setMatrix(matrix: &matrix, row: start.row, col: col, value: next)
                movedNumbers.append(next)
            }
            for row in start.row + 1 ... end.row {
                next = setMatrix(matrix: &matrix, row: row, col: end.col, value: next)
                movedNumbers.append(next)
            }
            for col in (start.col ... end.col - 1).reversed() {
                next = setMatrix(matrix: &matrix, row: end.row, col: col, value: next)
                movedNumbers.append(next)
            }
            for row in (start.row ... end.row - 1).reversed() {
                next = setMatrix(matrix: &matrix, row: row, col: start.col, value: next)
                movedNumbers.append(next)
            }
            minimumNumebr.append(movedNumbers.sorted(by: <).first!)
        }
        
        return minimumNumebr
    }
    
    private func getMatrix(rows: Int, columns: Int) -> [[Int]] {
        var matrix: [[Int]] = []
        for row in (1 ... rows) {
            matrix.append([])
            for col in (1 ... columns) {
                matrix[row - 1].append(col + ((row - 1) * columns))
            }
        }
        return matrix
    }
    
    private func setMatrix(matrix: inout [[Int]], row: Int, col: Int, value: Int) -> Int {
        let temp = matrix[row - 1][col - 1]
        matrix[row - 1][col - 1] = value
        return temp
    }
}

//테스트 1 〉    통과 (0.22ms, 16.6MB)
//테스트 2 〉    통과 (0.19ms, 16.6MB)
//테스트 3 〉    통과 (1737.52ms, 19.3MB)
//테스트 4 〉    통과 (976.08ms, 18.7MB)
//테스트 5 〉    통과 (1410.64ms, 18.5MB)
//테스트 6 〉    통과 (1466.20ms, 20.1MB)
//테스트 7 〉    통과 (1645.05ms, 20.5MB)
//테스트 8 〉    통과 (957.45ms, 18.6MB)
//테스트 9 〉    통과 (1385.94ms, 20MB)
//테스트 10 〉    통과 (1133.57ms, 19MB)
//테스트 11 〉    통과 (1023.94ms, 18.6MB)
