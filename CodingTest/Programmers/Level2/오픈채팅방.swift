//
//  오픈채팅방.swift
//  CodingTest
//
//  Created by 조민기 on 2022/04/05.
//

import Foundation

class 오픈채팅방 {
    struct History {
        let action: Action
        let user: User
        
        var message: String {
            user.nickname + "님이 " + action.string
        }
        
        init(action: Action, id: String, nickname: String) {
            self.action = action
            self.user = User(id: id, nickname: nickname)
        }
        init(record: String) {
            let components = record.components(separatedBy: " ")
            let nickname = components.count == 3 ? components[2] : ""
            
            action = Action(rawValue: components[0])!
            user = User(id: components[1], nickname: nickname)
        }
    }
    
    struct User {
        let id: String
        let nickname: String
    }
    
    enum Action: String {
        case enter = "Enter"
        case leave = "Leave"
        case change = "Change"
        
        var string: String {
            switch self {
            case .enter:
                return "들어왔습니다."
            case .leave:
                return "나갔습니다."
            default:
                return ""
            }
        }
    }
    
    func solution(_ record:[String]) -> [String] {
        let historyArr = record.map({ History(record: $0) })
        return applyChangedNickname(historyArr).map({
            $0.message
        })
    }
    
    private func applyChangedNickname(_ history: [History]) -> [History] {
        let nicknameMap: [String:String] = makeNicknameMap(history)
        return history.filter({ $0.action != .change }).map({
            History(action: $0.action, id: $0.user.id, nickname: nicknameMap[$0.user.id] ?? "")
        })
    }
    
    private func makeNicknameMap(_ history: [History]) -> [String:String] {
        var map: [String:String] = [:]
        history.forEach({
            if $0.action == .enter || $0.action == .change {
                map[$0.user.id] = $0.user.nickname
            }
        })
        return map
    }
}

//테스트 1 〉    통과 (0.20ms, 16.3MB)
//테스트 2 〉    통과 (0.19ms, 16.3MB)
//테스트 3 〉    통과 (0.48ms, 16.6MB)
//테스트 4 〉    통과 (0.43ms, 16.3MB)
//테스트 5 〉    통과 (6.60ms, 16.6MB)
//테스트 6 〉    통과 (7.04ms, 16.5MB)
//테스트 7 〉    통과 (6.39ms, 16.8MB)
//테스트 8 〉    통과 (6.56ms, 16.8MB)
//테스트 9 〉    통과 (7.32ms, 16.8MB)
//테스트 10 〉    통과 (6.53ms, 16.8MB)
//테스트 11 〉    통과 (3.59ms, 16.5MB)
//테스트 12 〉    통과 (3.52ms, 16.7MB)
//테스트 13 〉    통과 (6.59ms, 16.9MB)
//테스트 14 〉    통과 (6.97ms, 16.7MB)
//테스트 15 〉    통과 (0.19ms, 16.2MB)
//테스트 16 〉    통과 (0.19ms, 16.2MB)
//테스트 17 〉    통과 (0.74ms, 16.6MB)
//테스트 18 〉    통과 (0.81ms, 16.6MB)
//테스트 19 〉    통과 (6.64ms, 16.6MB)
//테스트 20 〉    통과 (6.68ms, 16.6MB)
//테스트 21 〉    통과 (6.79ms, 16.8MB)
//테스트 22 〉    통과 (6.67ms, 16.8MB)
//테스트 23 〉    통과 (6.26ms, 16.7MB)
//테스트 24 〉    통과 (6.65ms, 16.9MB)
//테스트 25 〉    통과 (637.37ms, 50.4MB)
//테스트 26 〉    통과 (665.86ms, 51.9MB)
//테스트 27 〉    통과 (682.66ms, 53.3MB)
//테스트 28 〉    통과 (726.94ms, 54.5MB)
//테스트 29 〉    통과 (692.20ms, 54.6MB)
//테스트 30 〉    통과 (703.97ms, 49.8MB)
//테스트 31 〉    통과 (661.02ms, 53.5MB)
//테스트 32 〉    통과 (572.84ms, 51.2MB)
