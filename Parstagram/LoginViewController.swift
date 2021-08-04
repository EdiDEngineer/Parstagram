//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Edidiong Ekong on 04/08/2021.
//

import UIKit
import Parse


class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        
        let username = userNameField.text ?? ""
         let password = passwordField.text ?? ""
    

        PFUser.logInWithUsername(inBackground:username, password:password) {
          (user: PFUser?, error: Error?) -> Void in
          if user != nil {
            self.performSegue(withIdentifier:   "onAuth", sender: self)
          } else {
            // The login failed. Check error to see why.
            print(error)

          }
        }

    }
    
    @IBAction func onSignUp(_ sender: Any) {
        
        myMethod()
    }
    
    func myMethod() {
        let user = PFUser()
        user.username = userNameField.text
        user.password = passwordField.text
   

      user.signUpInBackground {
        (succeeded: Bool, error: Error?) -> Void in
        if let error = error {
          let errorString = error.localizedDescription
          print(errorString)
        } else {
            self.performSegue(withIdentifier:   "onAuth", sender: self)
            
        }
      }
        
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
