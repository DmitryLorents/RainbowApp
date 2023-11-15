//
//  ResultCell.swift
//  RainbowApp
//
//  Created by Nikita Savchik on 15/11/2023.
//

import UIKit
import SnapKit

class ResultCell: UITableViewCell {
    
    static let identifier = "ResultCell"
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var gameLabel: UILabel = {
        setupLabel(
            withFont: "Avenir Next Medium",
            size: 25,
            andColor: .purple
        )
    }()
    
    private lazy var timeLabel: UILabel = {
        setupLabel(
            withFont: "Avenir Next",
            size: 20,
            andColor: .black
        )
    }()
    
    private lazy var speedLabel: UILabel = {
        setupLabel(
            withFont: "Avenir Next",
            size: 20,
            andColor: .black
        )
    }()
    
    private lazy var currentAnswers: UILabel = {
        setupLabel(
            withFont: "Avenir Next Bold",
            size: 20,
            andColor: .systemGreen
        )
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(game: Int, time: Int, speed: Int, answers: Int, questions: Int) {
        gameLabel.text = "Игра №\(game)"
        timeLabel.text = "Время \(time) sec."
        speedLabel.text = "Скорость x\(speed)"
        currentAnswers.text = "Угадано \(answers)/\(questions)"
    }
    
    private func setupUI() {
        contentView.addSubview(backView)
        setupSubviews(
            for: backView,
            subview: gameLabel, timeLabel, speedLabel, currentAnswers
        )
        backgroundColor = .clear
    }
    
    private func setupLabel(withFont font: String, size: CGFloat, andColor color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: font, size: size)
        label.textColor = color
        return label
    }
    
    private func setupSubviews(for view: UIView, subview: UIView...) {
        subview.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        gameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(15)
            make.height.equalTo(50)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(-5)
            make.leading.equalToSuperview().inset(15)
            make.height.equalTo(50)
        }
        
        speedLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(50)
        }
        
        currentAnswers.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(-5)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(50)
        }
    }
}
