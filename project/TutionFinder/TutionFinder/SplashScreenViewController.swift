//
//  SplashScreenViewController.swift
//  TutionFinder
//
//  Created by kuet on 18/12/22.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame:CGRect(x: 0, y: 0, width: 298, height: 315))
        imageView.image = UIImage(named: "app_logo")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(imageView)
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            self.performSegue(withIdentifier: "splash", sender: self)
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+3){
            self.animation()
        }
    }
    
    func animation(){
        UIView.animate(withDuration: 1){
            let size = self.view.frame.size.width*2
            let xposition = size - self.view.frame.width
            let yposition = self.view.frame.height - size
            
            self.imageView.frame = CGRect(x: -(xposition/2), y:yposition/2, width: size, height: size)
            self.imageView.alpha = 0
        }
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
