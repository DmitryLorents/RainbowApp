//
//  File.swift
//  RainbowApp
//
//  Created by Nikita Savchik on 15/11/2023.
//

import UIKit
import SnapKit

class ResultView: UIView {
    
    private lazy var headerTitleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 40
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.addArrangedSubview(returnButton)
        stack.addArrangedSubview(headerTitle)
        return stack
    }()
    
    private lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Medium", size: 30)
        label.text = "Статистика"
        label.textColor = .black
        return label
    }()
    
    private lazy var returnButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "arrow"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.tintColor = .black
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ResultCell.self, forCellReuseIdentifier: ResultCell.identifier)
        return tableView
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Очистить статистику", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Medium", size: 25)
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegates(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
}

private extension ResultView {
    private func setupUI() {
        backgroundColor = .systemGray
        setupSubviews(
            headerTitleStack,
            tableView,
            clearButton
        )
    }
    
    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            addSubview(subview)
        }
    }
    
    private func setConstraints() {
        headerTitleStack.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(10)
            make.leading.equalTo(safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.width.equalTo(300)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(80)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(clearButton.snp.top).inset(-30)
        }
        
        clearButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(40)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(40)
            make.height.equalTo(80)
        }
    }
}
