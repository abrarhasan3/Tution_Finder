//
//  postAct.swift
//  TutionFinder
//
//  Created by Ahsan Habib on 12/2/22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import FirebaseCore

class postAct: UIViewController {
    
   

    @IBAction func backBtnPost(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "postTution")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
    }
    
    /*@IBAction func data(_ sender: Any) {
        var l = Auth.auth().currentUser?.uid
        var ref : DatabaseReference!
        ref = Database.database().reference()
        if(l == nil)
        {
            
        }
        else
        {
            ref.child(l!).setValue(["UserName": "ABRAR"])
        }
       
    }*/
    @IBOutlet weak var subject1: UITextField!
    @IBOutlet weak var cont: UITextField!
    @IBOutlet weak var Loc1: UITextField!
    @IBOutlet weak var sal: UITextField!
    @IBOutlet weak var wkd: UITextField!
    @IBOutlet weak var cls1: UITextField!
    @IBAction func submit_buttom(_ sender: Any) {
        
        
        let l = Auth.auth().currentUser?.uid
        var ref : DatabaseReference!
        ref = Database.database().reference()
        if(l == nil)
        {
            
        }
        else
        {
            ref.child("count").child(l!).getData(completion:  { error, snapshot in
              guard error == nil else {
                print(error!.localizedDescription)
                return;
              }
                let userName = snapshot?.value as? Int ?? -1;
                ref.child(l!).child(String(userName)).setValue(["LOCATION": self.Loc1.text,"Class": self.cls1.text,"Subject":self.subject1.text,"Days":self.wkd.text,"Salary":self.sal.text,"Contact":self.cont.text , "index":userName])
                ref.child("count").child(l!).setValue(userName+1)
            });
            
            let s = UIStoryboard(name: "Main", bundle: nil)
            let vc = s.instantiateViewController(identifier: "homepage")
            vc.modalPresentationStyle = .overFullScreen
            present(vc,animated:  true)
        }
        /*Loc1.text = ""
        cls1.text = ""
        subject1.text = ""
        wkd.text = ""
        sal.text = ""
        cont.text = ""*/
     
    }
    @IBOutlet weak var sub1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
