//
//  ViewController.swift
//  FingerprintLock
//
//  Created by vishal on 07/02/18.
//  Copyright © 2018 Vishal. All rights reserved.
//

import UIKit
import LocalAuthentication
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.authenticateUser()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func authenticateUser(){
        let context = LAContext()
        var error:NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "Identify yourself!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: { (success, authenticationError) in
                DispatchQueue.main.async {
                    if success {
                    print("Success")
                    }
                    else{
                        let alert  = UIAlertController(title: "Authentication failed", message: "Sorry!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            })
        }
        else{
            let alert  = UIAlertController(title: "Touch ID not available", message: "Your device is not configured for Touch ID.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

