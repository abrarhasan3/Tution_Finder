//
//  homePage.swift
//  TutionFinder
//
//  Created by Ahsan Habib on 12/2/22.
//

import UIKit
import Firebase
import FirebaseAuth

class homePage: UIViewController {

    @IBAction func backHomepage(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "loginScreen")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
    }
    @IBAction func apiBtn(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "basicApi")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
    }
    @IBAction func post(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "postTution")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
        
    }
    @IBAction func logout(_ sender: Any) {
        /*do{
            try Auth.auth().signOut()
            let s = UIStoryboard(name: "Main", bundle: nil)
            let vc = s.instantiateViewController(identifier: "loginScreen")
            vc.modalPresentationStyle = .overFullScreen
            present(vc,animated:  true)
        }catch let signOutError as NSError {
                print("Error Sign Out ", signOutError)
            }*/
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "storyProfile")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
        
    }
    @IBAction func searchbutton(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "choiceAct")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
        
    }
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
