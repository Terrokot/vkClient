//
//  AuthViewController.swift
//  vkClient
//
//  Created by Egor Tereshonok on 1/21/20.
//  Copyright © 2020 Egor Tereshonok. All rights reserved.
//

import UIKit
import VK_ios_sdk


class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //authService = AuthService()
        authService = AppDelegate.shared().authService
    }
    

    @IBAction func signInButton() {
        authService.wakeUpSession()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
