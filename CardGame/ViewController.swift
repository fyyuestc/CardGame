//
//  ViewController.swift
//  CardGame
//
//  Created by fanyunyimac on 2018/9/8.
//  Copyright © 2018年 范云翼. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    lazy var game = CardGame(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    //属性观察器->展示翻卡次数
    var flipCount = 0 { didSet { flipCountLable.text = "Flips : \(flipCount)" } }
    //所有卡片关联的出口，所有卡片的集合
    @IBOutlet var cardButtons: [UIButton]!
    //翻卡次数标签
    @IBOutlet weak var flipCountLable: UILabel!

    //所有UIBotton所关联的action
    @IBAction func UIButton(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("chosen card was not in the cardButtons !")
        }
    }
    //从模型更新视图,如果点击没翻的卡片则翻出，注意与model中chooseCard的顺序
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                    button.setTitle(emoji(for: card), for: UIControlState.normal)
                    button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            }
        }
    }
    
    @IBAction func restartGame(_ sender: UIButton) {
        
    }
    
    //emoji
    var emojiChoices = ["🦆","👻","🎃","💀","🍎","🍭","🍷","🍒"]
    //emoji字典
    var emoji = [Int:String]()
    //初始化emoji字典以及返回字典中已经存在的卡片的emoji
    func emoji(for card : Card) -> String {
        //如果emoji字典中对应的卡片上没有emoji且emoji数组中有图片
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
            //随机生成一个小于emoji数组大小的无符号Int数
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            //初始化对应卡片后，把对应的emoji图片从数组中去除
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

