//
//  SettingsHeader.swift
//  Tinder Clone
//
//  Created by Ali Eldeeb on 2/9/23.
//

import UIKit

protocol SettingsHeaderDelegate: AnyObject {
    func settingsHeader(_ header: SettingsHeader, didSelect index: Int)
}

class SettingsHeader: UIView {
    
    //MARK: - Properties
    
    weak var delegate: SettingsHeaderDelegate?
    
    var buttons = [UIButton]()

    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureViewComponents() {
        backgroundColor = .systemGroupedBackground
        
        let button1 = createButton(0)
        let button2 = createButton(1)
        let button3 = createButton(2)
        
        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)
        
        addSubview(button1)
        button1.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, paddingTop: 16, paddingLeading: 16, paddingBottom: 16)
        button1.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [button2, button3])
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        
        addSubview(stack)
        stack.anchor(top: topAnchor, leading: button1.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 16, paddingLeading: 16, paddingBottom: 16, paddingTrailing: 16)
    }
    
    private func createButton(_ index: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Select Photo", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        button.clipsToBounds = true
        button.backgroundColor = .white
        button.imageView?.contentMode = .scaleAspectFill
        button.tag = index
        return button
    }
    
    //MARK: - Selectors
    
    @objc private func handleSelectPhoto(sender: UIButton) {
        //delegate method
        delegate?.settingsHeader(self, didSelect: sender.tag)
    }
    
}
