//
//  Card.swift
//  CardGame
//
//  Created by fanyunyimac on 2018/9/8.
//  Copyright © 2018年 范云翼. All rights reserved.
//

import Foundation
//类Card
struct Card
{
    var isFaceUp = false
    //卡片是否配对
    var isMatched = false
    //每张卡片的标识，从0开始+1
    var identifier : Int
    
    static var identifierFactory = -1
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
