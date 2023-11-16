//
//  5ViewController.swift
//  RainbowApp
//
//  Created by Dmitry on 09.11.2023.
//

import UIKit

class GameViewController: UIViewController {
    //MARK: - Parameters
    private lazy var gameView = GameView(titleButton: "\(Int(speed)) X")// есть init куда можно добавить [UIColor] и [String]. делать поментку .shuffled
    private let buttonLeft = NavBarButton(with: .left)
    private let buttonRight = NavBarButton(with: .right)
    private var counter = 0
    private var timer: Timer?
    private var secondsRemaining = gameData.settingsModel.gameTime
    private var speed: Double = Double(gameData.settingsModel.changeTime) //всего до 5х
    
    private var titleTimer: String {
        switch secondsRemaining {
        case 60:
            return "01:00"
        case 10...59:
            return "00:\(secondsRemaining)"
        case 1...9:
            return "00:0\(secondsRemaining)"
        case 0:
            return "00:00"
        default:
            return ""
        }
    }
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        addNavBarButton()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    //MARK: - Methods
    
    @objc func updateTimer() {
        switch secondsRemaining {
        case 60:
            title = "01:00"
            secondsRemaining -= 1
        case 10...59:
            title = "00:\(secondsRemaining)"
            secondsRemaining -= 1
        case 1...9:
            title = "00:0\(secondsRemaining)"
            secondsRemaining -= 1
        case 0:
            timer?.invalidate()
            title = "Время вышло"
            print("Вы набрали \(counter) балла")
            buttonRight.isEnabled = false
        default:
            break
        }
    }
}
//MARK: - ButtonGameDelegate
extension GameViewController: ButtonGameDelegate {
    func buttonTapped(count: Int) {
        if count == 1 {
            counter += 1
        } else {
            counter -= 1
        }
        print(counter) //прописать функцию сохранения данных
    }
    
    //MARK: - AddNavBarButton
    func addNavBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonLeft)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonRight)
    }
}

//MARK: - SetViews
extension GameViewController {
    private func setViews() {
        view = gameView
        title = titleTimer
        gameView.backgroundColor = hexStringToUIColor(hex: gameData.settingsModel.backgroundColor)
        
        gameView.firstButton.delegate = self
        gameView.secondButton.delegate = self
        gameView.thirdButton.delegate = self
        gameView.fourButton.delegate = self
        gameView.fiveButton.delegate = self
        
        buttonLeft.delegate = self
        buttonRight.delegate = self
    }
}

//MARK: - NavBarButtonDelegate
extension GameViewController: NavBarButtonDelegate {
    func leftBarButtonTapped() {
        navigationController?.popViewController(animated: true)
        timer?.invalidate()
        //прописать фунцию сохранения результата
    }
    func rightBarButtonTapped() {
        if timer?.isValid == true {
            timer?.invalidate()
            print(secondsRemaining + 1)
            
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
}
