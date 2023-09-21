//
//  Data.swift
//  MyApp2
//
//  Created by 보경 on 2023/08/25.
//

import Foundation

class Data {
    static let shared = Data()

    private init() {}
    
    var todoData: [String:[String]] = ["고양이 돌보기":["힘들어도 놀아주기", "궁디팡팡 해주기"], "공부":["TIL 작성하기"]]
    var doneData: [String:[String]] = ["공부":["내배캠 출석체크"], "집안일":["방 치우기", "설거지 하기", "음식물 쓰레기 처리하기"]]
    var category:[String] = ["고양이 돌보기", "공부", "집안일"]
    var emoji = ["😻", "📝", "🧽"]
}
