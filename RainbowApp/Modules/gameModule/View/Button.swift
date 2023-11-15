//
//  Buttons.swift
//  RainbowApp
//
//  Created by Николай on 14.11.2023.
//

import UIKit

protocol ButtonGameDelegate: AnyObject {
    func buttonTapped(button: UIButton)
}

final class Button: UIButton {
    weak var delegate: ButtonGameDelegate?
    private var isActive = false
    
    private let dotView: UIImageView = {
        let view = UIImageView()
        view.image = Image.dot
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(color: UIColor?, title: String?, titleColor: UIColor?) {
        super.init(frame: .zero)
        backgroundColor = color
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(dotView)
        addTarget(self, action: #selector(didButtonTapped), for: .touchUpInside)
        makeSystem(self)
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc private func didButtonTapped(sender: UIButton) {
        if let checkImageView = dotView.subviews.first(where: { $0 is UIImageView }) {
            checkImageView.removeFromSuperview()
        } else {
            let checkImageView = UIImageView(image: Image.chek)
            dotView.addSubview(checkImageView)
        }
        isActive.toggle()
        delegate?.buttonTapped(button: sender)
    }
    
    private func setContraints () {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 205),
            heightAnchor.constraint(equalToConstant: 40),
            
            dotView.centerYAnchor.constraint(equalTo: centerYAnchor),
            dotView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dotView.widthAnchor.constraint(equalToConstant: 20),
            dotView.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
}