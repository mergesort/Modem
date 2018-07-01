//
//  RootViewController.swift
//  Modem-Example
//
//  Created by Joe Fabisevich on 7/1/18.
//  Copyright © 2018 Mergesort. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    private let loadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("  Load a Tweet  ", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 4.0

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)

        self.view.addSubview(self.loadButton)

        self.loadButton.translatesAutoresizingMaskIntoConstraints = false
        self.loadButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.loadButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true

        self.loadButton.addTarget(self, action: #selector(loadButtonTapped), for: .touchUpInside)
    }

    @objc func loadButtonTapped() {
        let tweet = Tweet(statusId: "123", text: "I speak many languages, I am very cutlured.")
        let viewController = TweetViewController(tweet: tweet)
        let tweetRoute = Route(destination: viewController, activity: tweet)

        Router.navigate(from: self, to: tweetRoute, withAction: .present(animated: true, completion: nil))
    }

}
