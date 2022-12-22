//
//  searchClassActivity.swift
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
class searchClassActivity: UIViewController, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data4.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let temp = data4[indexPath.row]
        let cell = table4.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! tblseachclass
        cell.loc4.text = temp.locvar
        cell.class4.text = temp.classT
        cell.subject4.text = temp.sub
        cell.week4.text = temp.week1
        cell.salary4.text = temp.salary
        cell.contact4.text = temp.contact1
        //cell.img.image = UIImage(named: sun.image)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    

    @IBAction func findbtn(_ sender: Any) {
        getData()
    }
    @IBOutlet weak var table4: UITableView!
    
    @IBOutlet weak var edittextwithclass: UITextField!
    
    struct customData{
        let locvar: String
        let classT: String
        let sub: String
        let week1: String
        let salary: String
        let contact1: String
    }
    
    var data4: [customData] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table4.dataSource = self
        table4.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backbtn(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "choiceAct")
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
    
    func getData()
    {
        let searchItem = edittextwithclass.text
        
        if(searchItem != nil)
        {
            let l = (Auth.auth().currentUser?.uid)!
            
            
            let db  = Database.database().reference().child(l)
            db.observe(DataEventType.value, with: {(snapshot) in
                if snapshot.childrenCount>0{
                    self.data4.removeAll()
                    
                    for d in snapshot.children.allObjects as![DataSnapshot]{
                        let dataObject = d.value as? [String: AnyObject]
                        
                        let locationName = dataObject?["LOCATION"]
                        let class1 = dataObject?["Class"]
                        let day = dataObject?["Days"]
                        let salary1 = dataObject?["Salary"]
                        let subject = dataObject?["Subject"]
                        let contactNo = dataObject?["Contact"]
                        if(class1 as? String == searchItem)
                        {
                            let temp = customData(locvar: locationName as! String, classT: class1 as! String, sub: subject as! String, week1: day as! String, salary: salary1 as! String, contact1: contactNo as! String)
                            self.data4.append(temp)
                        }
                        
                        
                    }
                    self.table4.reloadData()
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
