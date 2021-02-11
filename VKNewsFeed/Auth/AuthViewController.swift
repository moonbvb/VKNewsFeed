//
//  AuthViewController.swift
//  VKNewsFeed
//
//  Created by Denis Suspicin on 10.02.2021.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = AppDelegate.shared().authService
    }
    
    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }

}
