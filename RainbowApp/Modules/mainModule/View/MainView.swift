//
//  5View.swift
//  RainbowApp
//
//  Created by Dmitry on 09.11.2023.
//

import UIKit

class MainView: UIView {
    
    //MARK: - Parameters
    
    private lazy var labelStack: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.addArrangedSubview(gameLabel)
        stack.addArrangedSubview(rainbowLabel)
        return stack
    }()
    
    private lazy var buttonStack: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.addArrangedSubview(newGameButton)
        stack.addArrangedSubview(statisticButton)
        return stack
    }()
    
    private lazy var rainbowImage: UIImageView = {
        let image = UIImageView()
        image.image = R.Image.rainbow
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var gameLabel: UILabel = {
        let label = UILabel()
        label.text = R.Label.nlpGame
        label.font = UIFont.systemFont(ofSize: 36, weight: .light)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var rainbowLabel: UILabel = {
        let label = UILabel()
        label.text = R.Label.rainbow
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var newGameButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle(R.Label.newGame, for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.widthAnchor.constraint(equalToConstant: 274).isActive = true
        button.heightAnchor.constraint(equalToConstant: 83).isActive = true
        //        button.addTarget(self, action: #selector(questionMarkButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var statisticButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.Label.stistic, for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.widthAnchor.constraint(equalToConstant: 274).isActive = true
        button.heightAnchor.constraint(equalToConstant: 83).isActive = true
        //        button.addTarget(self, action: #selector(questionMarkButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var questionMarkButton: UIButton = {
        let button = UIButton()
        button.setImage(R.Image.questionMark, for: .normal)
        //        button.addTarget(self, action: #selector(questionMarkButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var configButton: UIButton = {
        let button = UIButton()
        button.setImage(R.Image.config, for: .normal)
        //        button.addTarget(self, action: #selector(configButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setupView() {
        backgroundColor = .white

        addSubview(rainbowImage)
        addSubview(questionMarkButton)
        addSubview(configButton)
        addSubview(labelStack)
        addSubview(buttonStack)
        
    }
    
    
    private func setContraints() {
        NSLayoutConstraint.activate([
            rainbowImage.topAnchor.constraint(equalTo: topAnchor, constant: 72),
            rainbowImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            rainbowImage.widthAnchor.constraint(equalToConstant: 302),
            rainbowImage.heightAnchor.constraint(equalToConstant: 150),
            
            questionMarkButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            questionMarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            questionMarkButton.heightAnchor.constraint(equalToConstant: 50),
            questionMarkButton.widthAnchor.constraint(equalToConstant: 50),
            
            configButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            configButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            configButton.heightAnchor.constraint(equalToConstant: 50),
            configButton.widthAnchor.constraint(equalToConstant: 50),
            
            labelStack.topAnchor.constraint(equalTo: rainbowImage.bottomAnchor, constant: 10),
            labelStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonStack.topAnchor.constraint(equalTo: labelStack.bottomAnchor, constant: 100),
            buttonStack.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    //MARK: - QuestionMarkButtonAction
    //    @objc private func questionMarkButtonTapped () {
    //        print("qb")
    //    }
    //
    //
    //    //MARK: - ConfigButtonAction
    //    @objc private func configButtonTapped () {
    //        print("cb")
    //
    //    }
}
