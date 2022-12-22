//
//  ViewController.swift
//  splash_screen_demo
//
//  Created by kuet on 4/12/22.
//

import UIKit

class ViewController: UIViewController {
    
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
            self.performSegue(withIdentifier: "segue", sender: self)
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

}

