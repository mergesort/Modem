//
//  NextScreenViewController.swift
//  Modem-Example
//
//  Created by Joe Fabisevich on 7/1/18.
//  Copyright © 2018 Mergesort. All rights reserved.
//

import UIKit

final class NextScreenViewController: UIViewController {

    private let pushButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle(" Push Next Screen ", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 4.0

        return button
    }()

    private let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle(" Dismiss Screen ", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 4.0

        return button
    }()

    private let presentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle(" Present Next Screen ", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 4.0

        return button
    }()

    private let textView: UITextView = {
        let textView = UITextView()
//        textView.backgroundColor = UIColor.clear
        textView.layer.cornerRadius = 8.0
        textView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        textView.backgroundColor = UIColor.red
        textView.textColor = UIColor.white
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title1)
        textView.isEditable = false

        return textView
    }()

    private let customActivity: NSUserActivity


    // MARK: Initializers

    init(userActivityConvertible: UserActivityConvertible) {
        self.customActivity = userActivityConvertible.userActivity

        super.init(nibName: nil, bundle: nil)

        self.userActivity = self.customActivity
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        self.customActivity = InitialScreenData(text: "Let the games begin").userActivity

        super.init(nibName: nil, bundle: nil)

        self.userActivity = self.customActivity
    }


    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)

        self.setup()
    }

}

private extension NextScreenViewController {

    func setup() {
        self.view.addSubview(self.pushButton)
        self.pushButton.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)

        self.view.addSubview(self.presentButton)
        self.presentButton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)

        self.view.addSubview(self.dismissButton)
        self.dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)

        self.view.addSubview(self.textView)
        self.textView.text = self.routerStack()

        self.setupConstraints()
    }

    func setupConstraints() {
        let horizontalInset: CGFloat = 32.0
        let verticalInset: CGFloat = 16.0
        let buttonHeight: CGFloat = 44.0

        let topButton: UIButton

        // Please don't lay out your constraints like this — it's only to prove a point.

        if
            let lastItem = Router.items.last,
            case .present = lastItem.action {
            topButton = self.dismissButton
        } else {
            topButton = self.pushButton
        }

        topButton.translatesAutoresizingMaskIntoConstraints = false
        let topButtonConstraints: [NSLayoutConstraint] = [
            topButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            topButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            topButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: verticalInset),
            topButton.heightAnchor.constraint(equalToConstant: buttonHeight),
        ]

        self.presentButton.translatesAutoresizingMaskIntoConstraints = false
        let presentButtonConstraints = [
            self.presentButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            self.presentButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            self.presentButton.topAnchor.constraint(equalTo: topButton.bottomAnchor, constant: verticalInset),
            self.presentButton.heightAnchor.constraint(equalToConstant: buttonHeight),
        ]

        self.textView.translatesAutoresizingMaskIntoConstraints = false
        let textViewConstraints = [
            self.textView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            self.textView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            self.textView.topAnchor.constraint(equalTo: self.presentButton.bottomAnchor, constant: verticalInset),
            self.textView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -verticalInset),
        ]

        let allConstraints = ([topButtonConstraints, presentButtonConstraints, textViewConstraints].flatMap { $0 })
        NSLayoutConstraint.activate(allConstraints)
    }

    @objc
    func pushButtonTapped() {
        let tweet = Tweet(statusId: "123", text: "I speak many languages, I am very cutlured.")
        self.navigateToNextScreen(from: self.navigationController!, userActivityConvertible: tweet, presentationAction: .push(animated: true))
    }

    @objc
    func presentButtonTapped() {
        let tweet = Tweet(statusId: "123", text: "I speak many languages, I am very cutlured.")
        self.navigateToNextScreen(from: self, userActivityConvertible: tweet, presentationAction: .present(animated: true, completion: nil))
    }
    
    @objc
    func dismissButtonTapped() {
        Router.navigate(with: .dismiss(self, animated: true, completion: nil))
    }

    func navigateToNextScreen(from fromViewController: UIViewController, userActivityConvertible: UserActivityConvertible, presentationAction: PresentationAction) {
        let viewController = NextScreenViewController(userActivityConvertible: userActivityConvertible)
        let route = Route(
            destination: viewController,
            activity: userActivityConvertible,
            action: presentationAction
        )

        // This would likely use another navigation mechanism in production, but bear with me in the mean time. 😄
        Router.navigate(from: fromViewController, to: route)
    }

}
