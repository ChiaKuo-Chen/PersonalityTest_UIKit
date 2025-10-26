//
//  MidPointData.swift
//  PersonalityTest
//
// A complete list of branching decision points used in the personality test.
// Each `MidPoint` includes the question, answer options, and their next destinations.
//

import SwiftUI


let MidPointData: [MidPoint] = [
    
    
    MidPoint(title: "你會覺得自己有點奇怪嗎？",
               choiceString: ["有那麼一點...", "完全不會" ],
               choiceDestination: [1, 2]
              ),
    // 0
    
    MidPoint(title: "你會對社交活動感到恐慌嗎？",
               choiceString: ["有那麼一點...", "完全不會" ],
               choiceDestination: [3, 4]
              ),
    // 1
    
    MidPoint(title: "你對社會規則的看法是什麼？",
               choiceString: ["規則是用來打破的", "規則對社會是必須的" , "規則不要讓別人不舒服就好"],
               choiceDestination: [5, 6, 7]
              ),
    // 2
    
    MidPoint(title: "你自認理性嗎？",
               choiceString: [ "是", "不"],
               choiceDestination: [8, 9]
              ),
    // 3
    
    MidPoint(title: "你覺得你有時候會有點難相處嗎？",
               choiceString: [ "才不會", "多多少少吧"],
               choiceDestination: [MbtiToIndex.INFJ.rawValue, 10],
               gotoEndView: [true, false]
              ),
    // 4
    
    MidPoint(title: "你會想嘗試極限運動嗎？",
               choiceString: [ "當然想啊", "才不要"],
               choiceDestination: [MbtiToIndex.ESTP.rawValue, 11],
               gotoEndView: [true, false]
              ),
    // 5
    
    MidPoint(title: "透過大吼大叫讓大家遵守規則？",
               choiceString: [ "沒錯", "不太好吧"],
               choiceDestination: [MbtiToIndex.ESTJ.rawValue, MbtiToIndex.ISTJ.rawValue],
               gotoEndView: [true, true]
              ),
    // 6
    
    MidPoint(title: "你對婚前性行為怎麼看？",
               choiceString: [ "不好吧", "可以接受"],
               choiceDestination: [MbtiToIndex.ISFJ.rawValue, 12],
               gotoEndView: [true, false]
              ),
    // 7

    MidPoint(title: "你自認感性嗎？",
               choiceString: [ "是", "不"],
               choiceDestination: [MbtiToIndex.INFJ.rawValue, 13],
               gotoEndView: [true, false]
              ),
    // 8
    
    MidPoint(title: "你自認感性嗎？",
               choiceString: [ "是", "我時常哭天喊地"],
               choiceDestination: [MbtiToIndex.INFJ.rawValue, MbtiToIndex.INFP.rawValue],
               gotoEndView: [true, true]
              ),
    // 9

    MidPoint(title: "你平日有點懶嗎？",
               choiceString: [ "對啊", "沒這回事"],
               choiceDestination: [15, MbtiToIndex.ENTJ.rawValue],
               gotoEndView: [false, true]
              ),
    // 10

    MidPoint(title: "比較喜歡靜態還是動態的娛樂？",
               choiceString: [ "靜態的", "動態的"],
               choiceDestination: [MbtiToIndex.ISFP.rawValue, MbtiToIndex.ESFP.rawValue],
               gotoEndView: [true, true]
              ),
    // 11

    MidPoint(title: "你對學歷很看重嗎？",
               choiceString: [ "學歷很重要", "沒那麼重要吧"],
               choiceDestination: [MbtiToIndex.ENFJ.rawValue, MbtiToIndex.ESFJ.rawValue],
               gotoEndView: [true, true]
              ),
    // 12
    
    MidPoint(title: "你確定你真的一點點感性都沒有？",
               choiceString: ["對我就是鐵石心腸", "這很複雜啦"],
               choiceDestination: [MbtiToIndex.INTJ.rawValue, 14],
               gotoEndView: [true, false]
              ),
    // 13
    
    MidPoint(title: "你喜歡重型機械嗎？",
               choiceString: ["我超喜歡", "還好"],
               choiceDestination: [MbtiToIndex.ISTP.rawValue, MbtiToIndex.INFP.rawValue],
               gotoEndView: [true, true]
              ),
    // 14
    
    MidPoint(title: "你相信星座運勢嗎？",
               choiceString: ["那就是騙錢用的", "多少會看一下"],
               choiceDestination: [MbtiToIndex.ENTP.rawValue, MbtiToIndex.ENFP.rawValue],
               gotoEndView: [true, true]
              )
    // 15

    
]
