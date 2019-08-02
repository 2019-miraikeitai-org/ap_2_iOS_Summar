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
    @IBOutlet weak var Button4view: UIButton!
 
    @IBOutlet weak var label: UILabel!
    
    
    var counter  = 0
    let Mypoint:CGPoint = CGPoint(x:78 ,y:559)
    let Mypoint1:CGPoint = CGPoint(x:58 ,y:459)
    let Mypoint2:CGPoint = CGPoint(x:128 ,y:464)
    let Mypoint3:CGPoint = CGPoint(x:172 ,y:519)
    let Mypoint4:CGPoint = CGPoint(x:166 ,y:592)
    

    @IBAction func startAction(_ sender: Any) {

    }
    @IBAction func searchButtonAction(_ sender: Any) {
        
        if counter == 0 {
        
        self.Botton1view.center = Mypoint
        UIView.animate(withDuration: 0.25, delay: 0.0, animations: {self.Botton1view.center.y -= 100.0; self.Botton1view.center.x -= 20.0}, completion: nil)
            
        
        self.Botton2view.center = Mypoint
            UIView.animate(withDuration: 0.25, delay: 0.0,  animations: {self.Botton2view.center.y -= 95.0; self.Botton2view.center.x += 50.0} , completion: nil)
        
        self.Button3view.center = Mypoint
        UIView.animate(withDuration: 0.25, delay: 0.0,  animations: {self.Button3view.center.y -= 40.0; self.Button3view.center.x += 94.0}, completion: nil)
            
        self.Button4view.center = Mypoint
        UIView.animate(withDuration: 0.25, delay: 0.0,animations: {self.Button4view.center.y += 33.0; self.Button4view.center.x += 88.0}, completion: nil)
        
        }
        else {
            self.Botton1view.center = Mypoint1
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {self.Botton1view.center.y += 100.0; self.Botton1view.center.x += 20.0}, completion: nil)
            
            self.Botton2view.center = Mypoint2
            UIView.animate(withDuration: 0.25, delay: 0.0,  animations: {self.Botton2view.center.y += 95.0; self.Botton2view.center.x -= 50.0} , completion: nil)
            
            self.Button3view.center = Mypoint3
            UIView.animate(withDuration: 0.25, delay: 0.0,  animations: {self.Button3view.center.y += 40.0; self.Button3view.center.x -= 94.0}, completion: nil)
            
            self.Button4view.center = Mypoint4
            UIView.animate(withDuration: 0.25, delay: 0.0,   animations: {self.Button4view.center.y -= 33.0; self.Button4view.center.x -= 88.0}, completion: nil)
            
            
            
        }
        
        counter += 1
        
        if counter == 2 {counter = 0}
        
        
    
    }
    
    @IBAction func Button1Action(_ sender: Any) {
        label.text = "b1 push!!"
    }
    @IBAction func Button2Action(_ sender: Any) {
         label.text = "b2 push!!"
    }
    
    @IBAction func Button3Action(_ sender: Any) {
         label.text = "b3 push!!"
    }
    
    @IBAction func Button4Action(_ sender: Any) {
         label.text = "b4 push!!"
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
