//
//  basicApi.swift
//  TutionFinder
//
//  Created by Ahsan Habib on 12/3/22.
//

import UIKit

class basicApi: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    @IBAction func backApi(_ sender: Any) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(identifier: "homepage")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated:  true)
    }
    
    struct convert: Codable {
        let base: String?
        let date: String?
        let rates : RR?
    }
struct RR : Codable{
    let USD : Float
    let AUD : Float
    let GBP : Float
    let BDT : Float
    let INR : Float
    let ZMW : Float
    let THB : Float
    let EUR : Float
    let AED : Float
    let AFN : Float
    let ALL : Float
    let ARS : Float
    let AZN : Float
    let BGN : Float
    let BHD : Float
    let BIF : Float
    let BSD : Float
    let CAD : Float
    let CNY : Float
    let DKK : Float
    let DZD : Float
    let EGP : Float
    let GEL : Float
    let GMD : Float
    let GNF : Float
    let GYD : Float
    let HRK : Float
    let IDR : Float
    let IQD : Float
    let IRR : Float
    let JPY : Float
    let KES : Float
    let KPW : Float
    let KRW : Float
    let LKR : Float
    let LYD : Float
    let MAD : Float
    let MKD : Float
    let MNT : Float
    let MUR : Float
    let MYR : Float
    let NGN : Float
    let NZD : Float
}
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var tableApi: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data11.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let temp = data11[indexPath.row]
        let cell = tableApi.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! apiTable
        cell.symbol.text = temp.symbol
        cell.price.text = String(temp.price)
        
        return cell;
    }
    struct customD{
        var symbol : String
        var price  : Float
    }
    var data11: [customD] = []
    let url = "http://ip.jsontest.com/"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableApi.dataSource = self
        tableApi.delegate = self
        fetchResultsFromApi()
        //print(data11.count)
      

        // Do any additional setup after loading the view.
    }
    
    func fetchResultsFromApi() {
            
            guard let Url = URL(string: "https://api.exchangerate.host/latest") else { return }
            URLSession.shared.dataTask(with: Url) { (data, response
                , error) in
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    let converted_data = try decoder.decode(convert.self, from: data)
                    self.date.text = converted_data.date;
                    
                    self.data11.append(customD(symbol: "USD", price: converted_data.rates!.USD))
                    
                    self.data11.append(customD(symbol: "AUD", price: converted_data.rates!.AUD))
                    
                    self.data11.append(customD(symbol: "GBP", price: converted_data.rates!.GBP))
                    
                    self.data11.append(customD(symbol: "BDT", price: converted_data.rates!.BDT))
                    
                    self.data11.append(customD(symbol: "INR", price: converted_data.rates!.INR))
                    
                    self.data11.append(customD(symbol: "ZMW", price: converted_data.rates!.ZMW))
                    
                    self.data11.append(customD(symbol: "THB", price: converted_data.rates!.THB))
                    
                    
                    
                    /*self.data11.append(customD(symbol: "EUROPE",price : converted_data.rates!.EUR))


                    self.data11.append(customD(symbol: "United Arab Emirates Dirham",price : converted_data.rates!.AED))



                    self.data11.append(customD(symbol: "Afghan Afghani",price : converted_data.rates!.AFN))



                    self.data11.append(customD(symbol: "Albania Lek",price : converted_data.rates!.ALL))



                    self.data11.append(customD(symbol: "Argentine peso",price : converted_data.rates!.ARS))



                    self.data11.append(customD(symbol: " Azerbaijani Manat",price : converted_data.rates!.AZN))



                    self.data11.append(customD(symbol: " Bulgarian Lev",price : converted_data.rates!.BGN))



                    self.data11.append(customD(symbol: " Bahraini Dinar",price : converted_data.rates!.BHD))



                    self.data11.append(customD(symbol: " Burundian Franc",price : converted_data.rates!.BIF))



                    self.data11.append(customD(symbol: "Bahamian Dollar",price : converted_data.rates!.BSD))



                    self.data11.append(customD(symbol: "Canadian Dollar",price : converted_data.rates!.CAD))



                    self.data11.append(customD(symbol: " Chinese Yuan",price : converted_data.rates!.CNY))



                    self.data11.append(customD(symbol: " Danish Krone",price : converted_data.rates!.DKK))



                    self.data11.append(customD(symbol: " Algerian Dinar",price : converted_data.rates!.DZD))



                    self.data11.append(customD(symbol: " Egyptian Pound",price : converted_data.rates!.EGP))



                    self.data11.append(customD(symbol: " Georgian Lari",price : converted_data.rates!.GEL))



                    self.data11.append(customD(symbol: "Gambian Dalasi",price : converted_data.rates!.GMD))



                    self.data11.append(customD(symbol: " Guinean Franc",price : converted_data.rates!.GNF))



                    self.data11.append(customD(symbol: " Guyanaese Dollar",price : converted_data.rates!.GYD))



                    self.data11.append(customD(symbol: " Croatian Kuna",price : converted_data.rates!.HRK))



                    self.data11.append(customD(symbol: " Indonesian Rupiah",price : converted_data.rates!.IDR))



                    self.data11.append(customD(symbol: " Iraqi Dinar",price : converted_data.rates!.IQD))



                    self.data11.append(customD(symbol: " Iranian Rial",price : converted_data.rates!.IRR))



                    self.data11.append(customD(symbol: " Japanese Yen",price : converted_data.rates!.JPY))



                    self.data11.append(customD(symbol: " Kenyan Shilling",price : converted_data.rates!.KES))



                    self.data11.append(customD(symbol: " North Korean Won",price : converted_data.rates!.KPW))



                    self.data11.append(customD(symbol: " South Korean won",price : converted_data.rates!.KRW))



                    self.data11.append(customD(symbol: " Sri Lankan Rupee",price : converted_data.rates!.LKR))



                    self.data11.append(customD(symbol: " Libyan Dinar",price : converted_data.rates!.LYD))



                    self.data11.append(customD(symbol: " Moroccan Dirham",price : converted_data.rates!.MAD))



                    self.data11.append(customD(symbol: " Macedonian Denar",price : converted_data.rates!.MKD))



                    self.data11.append(customD(symbol: " Mongolian Tugrik",price : converted_data.rates!.MNT))



                    self.data11.append(customD(symbol: " Mauritian Rupee",price : converted_data.rates!.MUR))



                    self.data11.append(customD(symbol: " Malaysian Ringgit",price : converted_data.rates!.MYR))



                    self.data11.append(customD(symbol: " Nigerian Naira",price : converted_data.rates!.NGN))



                    self.data11.append(customD(symbol: " New Zealand Dollar",price : converted_data.rates!.NZD))*/










                    print(converted_data.rates!.THB)
                    print("here")
                    print(self.data11.count)
                    self.tableApi.reloadData()
                } catch let err {
                    print("Err", err)
                }
                }.resume()
        
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
