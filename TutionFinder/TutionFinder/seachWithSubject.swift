//
//  seachWithSubject.swift
//  TutionFinder
//
//  Created by kuet on 22/12/22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import FirebaseCore

class seachWithSubject: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data5.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let temp = data5[indexPath.row]
        let cell = table5.dequeueReusableCell(withIdentifier: "cell5", for: indexPath) as! tblsearchsubject
        cell.loc5.text = temp.locvar
        cell.class5.text = temp.classT
        cell.subject5.text = temp.sub
        cell.week5.text = temp.week1
        cell.salary5.text = temp.salary
        cell.contact5.text = temp.contact1
        //cell.img.image = UIImage(named: sun.image)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    @IBOutlet weak var table5: UITableView!
    
    @IBAction func findbtn5(_ sender: Any) {
        getData()
    }
    @IBOutlet weak var edittextSearchSubject: UITextField!
    
    
    
    struct customData{
        let locvar: String
        let classT: String
        let sub: String
        let week1: String
        let salary: String
        let contact1: String
    }
    
    var data5: [customData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table5.dataSource = self
        table5.delegate = self

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
    
    @IBAction func backbtn5(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "choiceAct")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
    }
    func getData()
    {
        let searchItem = edittextSearchSubject.text
        
        if(searchItem != nil)
        {
            let l = (Auth.auth().currentUser?.uid)!
            
            
            let db  = Database.database().reference().child(l)
            db.observe(DataEventType.value, with: {(snapshot) in
                if snapshot.childrenCount>0{
                    self.data5.removeAll()
                    
                    for d in snapshot.children.allObjects as![DataSnapshot]{
                        let dataObject = d.value as? [String: AnyObject]
                        
                        let locationName = dataObject?["LOCATION"]
                        let class1 = dataObject?["Class"]
                        let day = dataObject?["Days"]
                        let salary1 = dataObject?["Salary"]
                        let subject = dataObject?["Subject"]
                        let contactNo = dataObject?["Contact"]
                        if(subject as? String == searchItem)
                        {
                            let temp = customData(locvar: locationName as! String, classT: class1 as! String, sub: subject as! String, week1: day as! String, salary: salary1 as! String, contact1: contactNo as! String)
                            self.data5.append(temp)
                        }
                        
                        
                    }
                    self.table5.reloadData()
                }
            })
        }
        else
        {
            print("Here")
        }
        
        //var l = Auth.auth().currentUser?.uid
        //var ref : DatabaseReference!
        //ref = Database.database().reference()
        
        
    }

}
