//
//  String+Extension.swift
//  CodingTest
//
//  Created by Lucid Dream mac mini on 2022/04/13.
//

import Foundation

extension String {
    func get(at: Int) -> String {
        guard at < self.count else { return "" }
        return String(self[index(startIndex, offsetBy: at)])
    }
    
    func substring(from: Int, to: Int) -> String {
        guard from <= to else { return "" }
        return substring(from: from, length: to - from + 1)
    }
    
    func substring(from: Int, length: Int) -> String {
        guard from < self.count else { return "" }
        let startIndex: String.Index = {
            self.index(self.startIndex, offsetBy: from)
        }()
        let endIndex: String.Index = {
            if from + length - 1 < self.count {
                return self.index(self.startIndex, offsetBy: from + length)
            } else {
                return self.index(self.startIndex, offsetBy: self.count)
            }
        }()
        return String(self[startIndex ..< endIndex])
    }
}
