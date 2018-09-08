//
//  CardGame.swift
//  CardGame
//
//  Created by fanyunyimac on 2018/9/8.
//  Copyright © 2018年 范云翼. All rights reserved.
//

//模型model
import Foundation

class CardGame
{
    //所有卡片的数组
    var cards = [Card]()
    //模型处理逻辑,3种情况->1:没有卡片面朝上，2:有两张卡朝上面的时候选了一张卡，3:一张卡朝上时选了另一张卡
    func chooseCard(at index : Int) {
        //记录是否有一张而且仅有一张卡朝上
        var indexOfOneAndOnlyFaceUpCard : Int?
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard,matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards :Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
       
    }
}
