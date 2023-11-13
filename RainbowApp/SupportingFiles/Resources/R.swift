//
//  Resources.swift
//  RainbowApp
//
//  Created by Николай on 12.11.2023.
//

import UIKit

enum R {
    enum Image {
        static let rainbow = UIImage(named: "rainbow")
        static let arrow = UIImage(named: "arrow")
        static let pause = UIImage(named: "pause")
        static let questionMark = UIImage(named: "question.mark")
        static let config = UIImage(named: "config")
    }
    
    enum Label {
        static let nlpGame = "НЛП игра"
        static let rainbow = "Радуга"
        static let newGame = "Новая игра"
        static let stistic = "Статистика"

    }
    
    enum Color {
        static let backgroundColor = hexStringToUIColor(hex: "#00000033")
    }
    
    enum Fonts {
        static func CormorantInfant (with size:CGFloat) -> UIFont {
            UIFont(name: "CormorantInfant-Regular", size: size) ?? UIFont()
            
        }
    }
}
