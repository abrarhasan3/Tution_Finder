//
//  searchActivity.swift
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

class searchActivity: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchbox: UITextField!
    
    @IBAction func backseachAct(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "choiceAct")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
    }
    @IBAction func findButton(_ sender: Any) {
        getData();
    }
    @IBOutlet weak var table: UITableView!
    
    struct customData{
        let locvar: String
        let classT: String
        let sub: String
        let week1: String
        let salary: String
        let contact1: String
    }
    
    var data: [customData] = []
    /*
     customData(locvar: "KHULNA", classT: "10", sub: "Bangla", week1: "7", salary: "10000", contact1: "017217"),
     customData(locvar: "KHULNA", classT: "10", sub: "Bangla", week1: "7", salary: "10000", contact1: "017217")
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        //tableView.dataSource = self
        /*var l = Auth.auth().currentUser?.uid
        var ref : DatabaseReference!
        ref = Database.database().reference()
        ref.child(l!).child("0").child("LOCATION").getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return;
          }
            let userName = snapshot?.value as? String ?? "Unknown";*/
            //self.read.text = userName
        //});

        // Do any additional setup after loading the view.
        
        
        
        //self.tableView.reloadData()
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
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customDataForTable
        cell.locTable.text = temp.locvar
        cell.classTable.text = temp.classT
        cell.subjectTable.text = temp.sub
        cell.weekTable.text = temp.week1
        cell.salaryTable.text = temp.salary
        cell.contactTable.text = temp.contact1
        //cell.img.image = UIImage(named: sun.image)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func getData()
    {
        let searchItem = searchbox.text
        
        if(searchItem != nil)
        {
            let l = (Auth.auth().currentUser?.uid)!
            
            
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
                        if(locationName as? String == searchItem)
                        {
                            let temp = customData(locvar: locationName as! String, classT: class1 as! String, sub: subject as! String, week1: day as! String, salary: salary1 as! String, contact1: contactNo as! String)
                            self.data.append(temp)
                        }
                        
                        
                    }
                    self.table.reloadData()
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
extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
