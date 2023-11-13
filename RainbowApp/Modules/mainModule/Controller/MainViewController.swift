//
//  5ViewController.swift
//  RainbowApp
//
//  Created by Nikolay1414 on 09.11.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Parameters
    private let mainView = MainView()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        
    }
    
}

extension MainViewController {
    //MARK: - Methods
    private func setViews() {
        view = mainView
        mainView.delegate = self
    }
}

extension MainViewController: MainViewDelegate {
    func didTapNewGameButton() {
        let vc = gameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapNextButton() {
        let vc = gameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapStatiticButton() {
        // let vc = result()
        // navigationController?.pushViewController(vc, animated: true)
        print("result")
    }
    
    func didTapConfigButton() {
        let vc = settingsViewController()
        navigationController?.pushViewController(vc, animated: true)

    }
    
    func didTapQuestionButton() {
        let vc = rulesViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
