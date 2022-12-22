//
//  LogIn.swift
//  TutionFinder
//
//  Created by Ahsan Habib on 12/2/22.
//
import FirebaseAuth
import Firebase
import UIKit

class LogIn: UIViewController {

    
    @IBAction func backBtnLogin(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "regAct")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
    }
    @IBOutlet weak var semail: UITextField!
    @IBOutlet weak var spass: UITextField!
    /*@IBOutlet weak var semail: UITextField!
    @IBOutlet weak var spass: UITextField!
    @IBAction func login(_ sender: Any) {
        
        flogin()
        
        
    }*/
    @IBAction func regBtn(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "regAct")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
    }
    @IBAction func loginButton(_ sender: Any) {
        if semail.text?.isEmpty == true{
            print("NO EMAIL")
            return
        }
        if spass.text?.isEmpty == true{
            print("NO Password")
            return
        }
        Auth.auth().signIn(withEmail: semail.text!, password: spass.text!){
            [weak self]authResult, err in
            guard let strongSelf = self else {return}
            if let err = err {
                print(err.localizedDescription)
            }
        }
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let s = UIStoryboard(name: "Main", bundle: nil)
            let vc = s.instantiateViewController(identifier: "homepage")
            vc.modalPresentationStyle = .overFullScreen
            present(vc,animated:  true)
            
        }
        
    }
    override func viewDidLoad() {
        
        let bb = UIBarButtonItem()
        bb.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = bb
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    /*func flogin()
    {
        
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
