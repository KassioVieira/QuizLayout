//
//  ViewController.swift
//  QuizLayout
//
//  Created by Kássio Vieira da Luz on 10/08/2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.text = "Hi, Kassio"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Let's make this day productive"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "UserIcon"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 40
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.orange.cgColor
        image.clipsToBounds = true
        image.backgroundColor = .orange
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        setupViews()
    }
    
    private func setupViews () {
        let stackView = UIStackView(arrangedSubviews: [userLabel, infoLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        view.addSubview(userImageView)
        
        NSLayoutConstraint.activate([
                    stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
                    stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

                    userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
                    userImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    userImageView.heightAnchor.constraint(equalToConstant: 80),
                    userImageView.widthAnchor.constraint(equalToConstant: 80),
                ])
    }

}

