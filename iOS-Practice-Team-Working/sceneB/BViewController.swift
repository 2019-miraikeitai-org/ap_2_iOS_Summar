//
//  BViewController.swift
//  iOS-Practice-Team-Working
//
//  Created by reiji kobayashi on 2019/06/27.
//  Copyright © 2019 reud. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Botton1view: UIButton!
    @IBOutlet weak var Botton2view: UIButton!
    @IBOutlet weak var Button3view: UIButton!
    
    @IBAction func startAction(_ sender: Any) {
        
 
        
    }
    @IBAction func searchButtonAction(_ sender: Any) {
        
        self.Botton1view.center = self.view.center
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .beginFromCurrentState , animations: {self.Botton1view.center.y += 100.0; self.Botton1view.center.x += 100.0}, completion: nil)
        
        self.Botton2view.center = self.view.center
        UIView.animate(withDuration: 0.25, delay: 0.0,  animations: {self.Botton2view.center.y += 100.0} , completion: nil)
        
        self.Button3view.center = self.view.center
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .beginFromCurrentState , animations: {self.Button3view.center.y += 100.0; self.Button3view.center.x -= 100.0}, completion: nil)
        
        
        
        
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
