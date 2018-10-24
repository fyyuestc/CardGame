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
    //记录是否有一张而且仅有一张卡朝上的卡片的索引，类型为可选类型
    var indexOfOneAndOnlyFaceUpCard : Int?
    //模型处理逻辑,3种情况->1:没有卡片面朝上，2:有两张卡朝上面的时候选了一张卡，3:一张卡朝上时选了另一张卡
    func chooseCard(at index : Int) {
        //记录是否有一张而且仅有一张卡朝上的卡片的索引，类型为可选类型
        //所选卡片没有配对
        if !cards[index].isMatched {
            //3：
            if let matchIndex = indexOfOneAndOnlyFaceUpCard,matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                //没有匹配成功则将两张图片显示
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else {
                //1.点击卡片时还没有一张卡片朝上，则只将点击卡片朝上
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                //此时只有这个点击卡片朝上，添加索引
                indexOfOneAndOnlyFaceUpCard = index
            }//else
        }//if
    }//func
    
    init(numberOfPairsOfCards :Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
       
    }
}
