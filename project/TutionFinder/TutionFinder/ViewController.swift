//
//  ViewController.swift
//  TutionFinder
//
//  Created by Ahsan Habib on 12/2/22.
//

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    
    var iconClick = true
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func button(_ sender: Any) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error\(error?.localizedDescription)")
                return
            }
            let l = Auth.auth().currentUser?.uid
            var ref : DatabaseReference!
            ref = Database.database().reference()
            
            if(l == nil)
            {
                
            }
            else
            {
                ref.child("count").child(l!).setValue(0)
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        password.isSecureTextEntry = true
    }
    @IBAction func iconAction(sender: AnyObject) {
        if iconClick {
            //password.secureTextEntry = false
        } else {
            //password.secureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    
}
