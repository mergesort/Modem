//
//  RootViewController.swift
//  Modem-Example
//
//  Created by Joe Fabisevich on 7/1/18.
//  Copyright © 2018 Mergesort. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {

    let nextScreenViewController: NextScreenViewController = {
        let initialScreenData = InitialScreenData(text: "Welcome to the app")

        return NextScreenViewController(userActivityConvertible: initialScreenData)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        self.addChild(self.nextScreenViewController)
        self.view.addSubview(self.nextScreenViewController.view)
        self.nextScreenViewController.didMove(toParent: self)

        self.nextScreenViewController.view.translatesAutoresizingMaskIntoConstraints = false

        let viewControllerConstraints = [
            self.nextScreenViewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.nextScreenViewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.nextScreenViewController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.nextScreenViewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ]

        NSLayoutConstraint.activate(viewControllerConstraints)
    }

}
