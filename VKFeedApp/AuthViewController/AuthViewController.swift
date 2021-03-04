//
//  ViewController.swift
//  VKFeedApp
//
//  Created by Egor Lass on 24.02.2021.
//  Copyright © 2021 Egor Mezhin. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!
    
    @IBOutlet weak var logInButton: UIButton!{
        didSet {
            logInButton.clipsToBounds = true
            logInButton.layer.cornerRadius = 10
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authService = SceneDelegate.shared().authService
        view.backgroundColor = .white
    }
    
    @IBAction func logInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
}
