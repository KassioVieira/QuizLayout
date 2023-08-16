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
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Let's make this day productive"
        label.font = UIFont.systemFont(ofSize: 14)
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
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userLabel, infoLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        adjustCardPosition()
    }
    
    private func setupViews() {
        view.addSubview(stackView)
        view.addSubview(userImageView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            userImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            userImageView.heightAnchor.constraint(equalToConstant: 80),
            userImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func adjustCardPosition() {
        let card = CardView(frame: CGRect(x: 16, y: stackView.frame.maxY + 40, width: view.frame.width - 32, height: 70))
        let trophyImage = UIImageView(image: UIImage(named: "Trophy"))
        let coinImage = UIImageView(image: UIImage(named: "Coin"))
        let rankingText = UILabel()
        let scoreLabel = UILabel()
        rankingText.text = "Ranking"
        scoreLabel.text = "Points"
        
        let positionText = UILabel()
        let scoreValue = UILabel()
        positionText.text = "348"
        scoreValue.text = "1209"
        
        trophyImage.contentMode = .center
        trophyImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        coinImage.contentMode = .center
        coinImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        let collumstackView = UIStackView(arrangedSubviews: [rankingText, positionText])
        collumstackView.axis = .vertical
        collumstackView.translatesAutoresizingMaskIntoConstraints = false
        
        let iconStackView1 = UIStackView(arrangedSubviews: [trophyImage, collumstackView])
        iconStackView1.axis = .horizontal
        iconStackView1.spacing = 8
        
        let collumstackView2 = UIStackView(arrangedSubviews: [scoreLabel, scoreValue])
        collumstackView2.axis = .vertical
        collumstackView2.translatesAutoresizingMaskIntoConstraints = false
        
        let iconStackView2 = UIStackView(arrangedSubviews: [coinImage, collumstackView2])
        iconStackView2.axis = .horizontal
        iconStackView2.spacing = 8
        
        let separator = UIView()
        separator.backgroundColor = .gray
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        let innerStackView = UIStackView(arrangedSubviews: [iconStackView1, separator, iconStackView2])
        innerStackView.axis = .horizontal
        innerStackView.spacing = 16
        
        separator.widthAnchor.constraint(equalToConstant: 1).isActive = true
        separator.heightAnchor.constraint(equalTo: innerStackView.heightAnchor).isActive = true
        
        let outerStackView = UIStackView(arrangedSubviews: [innerStackView])
        outerStackView.axis = .vertical
        outerStackView.spacing = 16
        
        card.addChildView(outerStackView)
        
        view.addSubview(card)
    }



}
