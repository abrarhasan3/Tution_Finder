//
//  seachWithSalary.swift
//  TutionFinder
//
//  Created by Ahsan Habib Swassow on 17/12/22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import FirebaseCore

class seachWithSalary: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    
    @IBAction func backSearchSal(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "choiceAct")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data3.count;
    }
    
    @IBAction func searchSalBtn(_ sender: Any) {
        getData();
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let temp = data3[indexPath.row]
        let cell = table3.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! seachWithSalaryCell
        cell.loc3.text = temp.locvar
        cell.class3.text = temp.classT
        cell.subject3.text = temp.sub
        cell.week3.text = temp.week1
        cell.salary3.text = temp.salary
        cell.contact3.text = temp.contact1
        //cell.img.image = UIImage(named: sun.image)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    

    @IBOutlet weak var table3: UITableView!
    struct customData{
        let locvar: String
        let classT: String
        let sub: String
        let week1: String
        let salary: String
        let contact1: String
    }
    
    var data3: [customData] = []
    
    @IBOutlet weak var first: UITextField!
    @IBOutlet weak var follow: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        table3.dataSource = self
        table3.delegate = self

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
    
    
    func getData()
    {
        let search1 = first.text
        let searchItem = follow.text
        let minVal = Int(search1!) ?? 0
        let maxVal = Int(searchItem!) ?? 0
        
        if(searchItem != nil)
        {
            let l = (Auth.auth().currentUser?.uid)!
            
            
            let db  = Database.database().reference().child(l)
            db.observe(DataEventType.value, with: {(snapshot) in
                if snapshot.childrenCount>0{
                    self.data3.removeAll()
                    
                    for d in snapshot.children.allObjects as![DataSnapshot]{
                        let dataObject = d.value as? [String: AnyObject]
                        
                        let locationName = dataObject?["LOCATION"]
                        let class1 = dataObject?["Class"]
                        let day = dataObject?["Days"]
                        let salary1 = dataObject?["Salary"]
                        let subject = dataObject?["Subject"]
                        let contactNo = dataObject?["Contact"]
                        let salary3 = Int(salary1 as! String) ?? 0
                        
                        if(minVal <= salary3 && salary3 <= maxVal )
                        {
                            let temp = customData(locvar: locationName as! String, classT: class1 as! String, sub: subject as! String, week1: day as! String, salary: salary1 as! String, contact1: contactNo as! String)
                            self.data3.append(temp)
                        }
                        
                        
                    }
                    self.table3.reloadData()
                }
            })
        }
        else
        {
            print("Here")
            self.showToast(message: "You Must Enter Data", font: .systemFont(ofSize: 12.0))
        }
        
        //var l = Auth.auth().currentUser?.uid
        //var ref : DatabaseReference!
        //ref = Database.database().reference()
        
        
    }

}
