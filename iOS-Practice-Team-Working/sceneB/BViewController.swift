//
//  BViewController.swift
//  iOS-Practice-Team-Working
//
//  Created by reiji kobayashi on 2019/06/27.
//  Copyright © 2019 reud. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    
    @IBOutlet weak var MainButtonView: UIButton!
    //新しいボタンの作成
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    
    override func viewDidLoad() {
        newbutton.makebutton(original: MainButtonView, target :button1)
        newbutton.makebutton(original: MainButtonView, target :button2)
        newbutton.makebutton(original: MainButtonView, target :button3)
        newbutton.makebutton(original: MainButtonView, target :button4)
        
        
        //ボタンを画面に出現させ、ボタンを押した時の動作を加える
        appearbutton(target: button1,number:1)
        appearbutton(target: button2,number:2)
        appearbutton(target: button3,number:3)
        appearbutton(target: button4,number:4)
        
        super.viewDidLoad()
        
        self.view.bringSubviewToFront(MainButtonView)
        
        // Do any additional setup after loading the view.
    }
    
    
  
    
    
    var counter  = 0

    
   
    @IBAction func searchButtonAction(_ sender: Any) {
        
        if counter == 0 {
            newbutton.animation(animation : button1 , buttonNumber: 1)
            newbutton.animation(animation : button2 , buttonNumber: 2)
            newbutton.animation(animation : button3 , buttonNumber: 3)
            newbutton.animation(animation : button4 , buttonNumber: 4)
 

        }
        else {
            newbutton.ranimation(animation : button1 , buttonNumber: 1)
            newbutton.ranimation(animation : button2 , buttonNumber: 2)
            newbutton.ranimation(animation : button3 , buttonNumber: 3)
            newbutton.ranimation(animation : button4 , buttonNumber: 4)
        }
        
        counter += 1
        
        if counter == 2 {counter = 0}
        
        
        
    }
    
    
    func appearbutton (target :UIButton , number:Int){
        
        self.view.addSubview(target)
        
        
        //指定した番号の操作を行うように設定（改善が全然あり）
        
        if number == 1 {
        target.addTarget(self, action: #selector(self.pushButton1), for: .touchUpInside)
        }
        
        if number == 2 {
            target.addTarget(self, action: #selector(self.pushButton2), for: .touchUpInside)
        }
        if number == 3 {
            target.addTarget(self, action: #selector(self.pushButton3), for: .touchUpInside)
        }
        
        if number == 4 {
            target.addTarget(self, action: #selector(self.pushButton4), for: .touchUpInside)
        }
    
    }
    
    
    
    //各ボタンを押した時の操作を記述
    
    @objc func pushButton1(sender: UIButton){
        print("1 pushed")
        
    }
    
    @objc func pushButton2(sender: UIButton){
        print("2 pushed")
        
    }
    
    @objc func pushButton3(sender: UIButton){
        print("3 pushed")
        
    }
    
    @objc func pushButton4(sender: UIButton){
        print("4 pushed")
        
    }
    
}
