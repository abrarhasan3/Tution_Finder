//
//  choiceAction.swift
//  TutionFinder
//
//  Created by Ahsan Habib on 12/2/22.
//

import UIKit

class choiceAction: UIViewController {

    @IBAction func backChoiceAction(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "homepage")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
        
    }
    @IBAction func Location(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "searchAct")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
    }
    @IBAction func searchWithSalary(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "searchSalary")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
    }
    @IBAction func searchWithClass(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func seachClass(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "searchclass")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
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
