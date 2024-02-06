//
//  LoginViewController.swift
//  LogInApp
//
//  Created by Zeynep Sude Yıldız on 23.08.2023.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBAction func loginBtn(_ sender: Any) {
    }
    let email = ""
    let password = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func OnClickLogin(_ sender: Any) {
        if  UserDefaults.standard.string(forKey: "Mail") == emailTxt.text! && UserDefaults.standard.string(forKey: "Password") == passwordTxt.text! {
            UserDefaults.standard.set(emailTxt.text, forKey: "Mail")
             
            UserDefaults.standard.set(true, forKey: "loginSuccess")
            self.dismiss(animated: true)
        } else {
            let alert = UIAlertController(title: "alert", message: "email or password is not matching", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "ok", style: .default)
            alert.addAction(ok)
           present(alert, animated: true)
        }
        
    }
    
}
