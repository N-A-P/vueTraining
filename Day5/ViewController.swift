//
//  ViewController.swift
//  Day5
//
//  Created by TuanDA on 8/6/20.
//  Copyright © 2020 TuanDA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.presentLogin()
    }

    func presentLogin() -> Void {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let login = storyboard.instantiateViewController(withIdentifier: "Login") as! LoginViewController

        login.modalPresentationStyle = .fullScreen
        login.modalTransitionStyle = .crossDissolve
        
        self.present(login, animated: true, completion: nil)

    }
}

