//
//  profileActivity.swift
//  TutionFinder
//
//  Created by kuet on 4/12/22.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class profileActivity: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    
    @IBOutlet weak var tblProfile1: UITableView!
    
    @IBAction func backBtnP(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "homepage")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
    }
    struct customData{
        let locvar: String
        let classT: String
        let sub: String
        let week1: String
        let salary: String
        let contact1: String
        let index :Int
    }
    
    var data: [customData] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblProfile1.dataSource = self
        tblProfile1.delegate = self
        getData()

        // Do any additional setup after loading the view.
    }
    func getData()
    {
    
        
            let l = (Auth.auth().currentUser?.uid)!
            
            print(l)
            let db  = Database.database().reference().child(l)
            
            db.observe(DataEventType.value, with: {(snapshot) in
                if snapshot.childrenCount>0{
                    self.data.removeAll()
                    
                    for d in snapshot.children.allObjects as![DataSnapshot]{
                        let dataObject = d.value as? [String: AnyObject]
                        
                        let locationName = dataObject?["LOCATION"]
                        let class1 = dataObject?["Class"]
                        let day = dataObject?["Days"]
                        let salary1 = dataObject?["Salary"]
                        let subject = dataObject?["Subject"]
                        let contactNo = dataObject?["Contact"]
                        let index1 = dataObject?["index"]
                        
                        let temp = customData(locvar: locationName as! String, classT: class1 as! String, sub: subject as! String, week1: day as! String, salary: salary1 as! String, contact1: contactNo as! String, index: index1 as! Int)
                            self.data.append(temp)
                        print(class1 as Any)
                    }
                    
                    self.tblProfile1.reloadData()
                }
            })
        
        //var l = Auth.auth().currentUser?.uid
        //var ref : DatabaseReference!
        //ref = Database.database().reference()
        
        
    }

    @IBAction func logoutact(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "loginScreen")
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let temp = data[indexPath.row]
        let cell = tblProfile1.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! profileTable
        cell.locProfile.text = temp.locvar
        cell.classProfile.text = temp.classT
        cell.subjectProfile.text = temp.sub
        cell.weekProfile.text = temp.week1
        cell.salaryProfile.text = temp.salary
        cell.contactProfile.text = temp.contact1
        cell.btnDelete = {[unowned self] in
            
            let l = (Auth.auth().currentUser?.uid)!
            let db1  = Database.database().reference().child(l).child(String(temp.index))
            db1.removeValue()
            let l1 = Auth.auth().currentUser?.uid
            var ref : DatabaseReference!
            ref = Database.database().reference()
            if(l1 == nil)
            {
                
            }
            else
            {
                ref.child("count").child(l1!).getData(completion:  { error, snapshot in
                  guard error == nil else {
                    print(error!.localizedDescription)
                    return;
                  }
                    let userName = snapshot?.value as? Int ?? -1;
                    
                    ref.child("count").child(l1!).setValue(userName-1)
                });
                
            }
        }
        //cell.img.image = UIImage(named: sun.image)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
