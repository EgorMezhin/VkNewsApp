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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }

    @IBAction func logInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
}

