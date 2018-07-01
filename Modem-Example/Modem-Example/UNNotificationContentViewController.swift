//
//  UNNotificationContentViewController.swift
//  Modem-Example
//
//  Created by Joe Fabisevich on 7/1/18.
//  Copyright © 2018 Mergesort. All rights reserved.
//

import UserNotifications
import UIKit

class UNNotificationContentViewController: UIViewController {

    private let notificationContent: UNNotificationContent

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0

        return label
    }()

    private let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("×", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 52.0)

        return button
    }()

    init(notificationContent: UNNotificationContent) {
        self.notificationContent = notificationContent

        super.init(nibName: nil, bundle: nil)

        self.userActivity = self.notificationContent.userActivity
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.label.text = self.notificationContent.title

        self.view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        self.view.addSubview(self.label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.label.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.label.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.label.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        self.view.addSubview(self.dismissButton)
        self.dismissButton.translatesAutoresizingMaskIntoConstraints = false
        self.dismissButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.dismissButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true

        let buttonSide: CGFloat = 44.0
        self.dismissButton.heightAnchor.constraint(equalToConstant: buttonSide).isActive = true
        self.dismissButton.widthAnchor.constraint(equalToConstant: buttonSide).isActive = true

        self.dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)

        self.printRouterStack()
    }

    @objc func dismissButtonTapped() {
        Router.navigate(with: DismissAction.dismiss(self, animated: true, completion: nil))
    }

}
