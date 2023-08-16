//
//  CardView.swift
//  QuizLayout
//
//  Created by Kássio Vieira da Luz on 16/08/2023.
//

import UIKit

class CardView: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // Setup UI
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        
     
        addSubview(contentView)
        
        contentView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
    
    func addChildView(_ view: UIView) {
        contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
