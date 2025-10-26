//
//  AnimalData.swift
//  PersonalityTest
//

import Foundation

// MARK: - ENDPOINT DATA

var AnimalData: [Animal] = [
    
    // ISTJ
    Animal(title: "貓頭鷹", overview: "務實的守望者", name: "owl", rarity: 3.98, description: """
安靜又專注，像夜晚的守護者。雖然不愛驚喜，但總是默默地用效率和信賴守護著身邊的人。
""", friend: [MbtiToIndex.ESFP.rawValue, MbtiToIndex.ESTP.rawValue]),
    
    // ISFJ
    Animal(title: "鹿", overview: "優雅的代表", name: "deer", rarity: 9.58, description: """
優雅中帶著一絲害羞，敏銳的第六感讓牠總能在危險來臨前輕巧避開，像森林裡的舞者。
""", friend: [MbtiToIndex.ESFP.rawValue, MbtiToIndex.ESTP.rawValue]),
    
    // INFJ
    Animal(title: "鯨魚", overview: "智慧的象徵", name: "whale", rarity: 6.29, description: """
溫柔又深沉，擁有寬廣的內心世界。牠們常把自己藏得很深，但那份慈悲讓人無法忽視。
""", friend: [MbtiToIndex.ENFP.rawValue, MbtiToIndex.ENTP.rawValue]),
    
    // INTJ
    Animal(title: "龍", overview: "離群的智者", name: "dragon", rarity: 2.87, description: """
聰明且神秘，熱愛挑戰難題。喜歡獨處，享受屬於自己的奇幻世界，總是充滿好奇的好奇心。
""", friend: [MbtiToIndex.ENFP.rawValue, MbtiToIndex.ENTP.rawValue]),
    
    // ISTP
    Animal(title: "豹", overview: "隱密的狙擊手", name: "leopard", rarity: 2.62, description: """
觀察力敏銳，行動迅速。習慣獨來獨往，很少有人能真正接近牠。
""", friend: [MbtiToIndex.ESFJ.rawValue, MbtiToIndex.ESTJ.rawValue]),
    
    // ISFP
    Animal(title: "長頸鹿", overview: "獨特的觀察者", name: "giraffe", rarity: 7.81, description: """
第一眼看起來有點古怪，但牠優雅又敏感，總能看到別人忽略的細節。
""", friend: [MbtiToIndex.ENFJ.rawValue, MbtiToIndex.ESFJ.rawValue, MbtiToIndex.ESTJ.rawValue]),
    
    // INFP
    Animal(title: "雪豹", overview: "抽象的先知", name: "snowLeopard", rarity: 14.23, description: """
神秘又優雅，對環境特別敏感，喜歡安靜的地方，是隱藏的天才。
""", friend: [MbtiToIndex.ENFJ.rawValue, MbtiToIndex.ENTJ.rawValue]),
    
    // INTP
    Animal(title: "貓", overview: "熱情的探索者", name: "cat", rarity: 5.57, description: """
聰明又好奇，對感興趣的事物充滿熱情，規則對牠來說只是挑戰的開始。
""", friend: [MbtiToIndex.ENTJ.rawValue, MbtiToIndex.ESTJ.rawValue]),
    
    // ESTP
    Animal(title: "熊", overview: "魅力的具現化", name: "bear", rarity: 2.36, description: """
好鬥又勇敢，充滿魅力。表面和善，內心卻擁有強大的戰鬥力。
""", friend: [MbtiToIndex.ISFJ.rawValue, MbtiToIndex.ISTJ.rawValue]),
    
    // ESFP
    Animal(title: "猴子", overview: "生活的體驗者", name: "monkey", rarity: 6.70, description: """
外向活潑，是團隊的開心果，創造力豐富，總能活在當下享受生活。
""", friend: [MbtiToIndex.ISFJ.rawValue, MbtiToIndex.ISTJ.rawValue]),
    
    // ENFP
    Animal(title: "獨角獸", overview: "夢幻的存在", name: "unicorn", rarity: 12.56, description: """
稀有又美麗，聰明忠誠且熱情，個性開朗積極，夢幻一般的存在。
""", friend: [MbtiToIndex.INFJ.rawValue, MbtiToIndex.INTJ.rawValue]),
    
    // ENTP
    Animal(title: "鸚鵡", overview: "華麗的明星", name: "parrot", rarity: 4.32, description: """
擅長言語，思維敏捷，喜歡展現自己的才華和觀點，是群體中的焦點。
""", friend: [MbtiToIndex.INFJ.rawValue, MbtiToIndex.INTJ.rawValue]),
    
    // ESTJ
    Animal(title: "鱷魚", overview: "力量的實現", name: "crocodile", rarity: 3.81, description: """
務實果斷，重視程序，行動迅速且有效，總能達成目標。
""", friend: [MbtiToIndex.INTP.rawValue, MbtiToIndex.ISFP.rawValue, MbtiToIndex.ISTP.rawValue]),
    
    // ESFJ
    Animal(title: "燕子", overview: "春天的化身", name: "swallow", rarity: 9.33, description: """
社交高手，外向開朗，真誠的笑容是牠最強的武器，總能贏得人心。
""", friend: [MbtiToIndex.ISFP.rawValue, MbtiToIndex.ISTP.rawValue]),
    
    // ENFJ
    Animal(title: "狗", overview: "可靠的夥伴", name: "dog", rarity: 5.80, description: """
擅長察覺細節，喜歡團隊合作，反應敏捷且責任感強，是最值得信賴的朋友。
""", friend: [MbtiToIndex.INFP.rawValue, MbtiToIndex.ISFP.rawValue]),
    
    // ENTJ
    Animal(title: "獅子", overview: "王者", name: "lion", rarity: 2.14, description: """
不僅強大，還有遠見和組織力，總是帶領團隊為勝利奮鬥。
""", friend: [MbtiToIndex.INFP.rawValue, MbtiToIndex.INTP.rawValue])
]
