//
//  BViewController.swift
//  iOS-Practice-Team-Working
//
//  Created by reiji kobayashi on 2019/06/27.
//  Copyright © 2019 reud. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    
    //ボタンは大きくmainbuttonとsubbuttonの二つに別れる
    //mainbuttonを押すとsubbuttonが現れるようになる
    //mainbuttonはstoryboard上で作る
    //subbuttonはstoryboardでは作らず、コードで作る
    
    
    @IBOutlet weak var MainButtonView: UIButton!
    
    
    //ここに新しいボタンの数countbuttonとその数だけUIButtonとidを持つ構造体SuButtonを定義する
    //buttonnumberはanimationして現れたとき左上から時計周りの順番で１から定義する
    let countbuttonn = 4
    let subbutton1 = SubButton( SubButtonUI: UIButton(), buttonnumber: 1)
    let subbutton2 = SubButton( SubButtonUI: UIButton(), buttonnumber: 2)
    let subbutton3 = SubButton( SubButtonUI: UIButton(), buttonnumber: 3)
    let subbutton4 = SubButton( SubButtonUI: UIButton(), buttonnumber: 4)
    
    override func viewDidLoad() {
        
    //MakeButton.swift内に記述のnewbuttonクラスのmakebutton関数
    //ボタンの初期設定を行う
    //originalにはmainbuttonのUIviewを、targetには新しいsubbuttonのUIviewを引数にする
        newbutton.makebutton(original: MainButtonView, target :subbutton1.SubButtonUI)
        newbutton.makebutton(original: MainButtonView, target :subbutton2.SubButtonUI)
        newbutton.makebutton(original: MainButtonView, target :subbutton3.SubButtonUI)
        newbutton.makebutton(original: MainButtonView, target :subbutton4.SubButtonUI)
        
        
        //ボタンを画面に出現させ、ボタンを押した時の動作を加える関数
        //これはviewcontroller.swift内に関数が記述されている
        appearbutton(target: subbutton1.SubButtonUI,number:subbutton1.buttonnumber)
        appearbutton(target: subbutton2.SubButtonUI,number:subbutton2.buttonnumber)
        appearbutton(target: subbutton3.SubButtonUI,number:subbutton3.buttonnumber)
        appearbutton(target: subbutton4.SubButtonUI,number:subbutton4.buttonnumber)
        
        super.viewDidLoad()
        
        self.view.bringSubviewToFront(MainButtonView)
        
        // Do any additional setup after loading the view.
    }
    
    
  
    
    
    var counter :Float  = -1.0

    
   //mainbuttonが押された時の内容がここに記述される
    @IBAction func MainButtonAction(_ sender: Any) {

       
    //MakeButton.swift内に記述のnewbuttonクラスのanimation関数でアニメーションできるようにする
            newbutton.animation(animation : subbutton1.SubButtonUI, Countbutton: countbuttonn,buttonNumber: subbutton1.buttonnumber , Counter :counter)
        newbutton.animation(animation : subbutton2.SubButtonUI, Countbutton: countbuttonn,buttonNumber: subbutton2.buttonnumber, Counter: counter)
        newbutton.animation(animation : subbutton3.SubButtonUI, Countbutton: countbuttonn,buttonNumber: subbutton3.buttonnumber, Counter: counter)
        newbutton.animation(animation : subbutton4.SubButtonUI, Countbutton: countbuttonn,buttonNumber: subbutton4.buttonnumber, Counter: counter)
 

//Mainbuttonの押された回数が奇数か偶数を測定するところ
        counter += 2.0
        
        if counter == 3.0 {counter = -1.0}
    }
    
    
    
    
    //画面上にsubbuttonが現れるようにする関数
    //MakeButton.swiftのnewbuttonクラス内にこの関数を入れたかったけどエラーが出たのでここに記述
    func appearbutton (target :UIButton , number:Int){
        
        self.view.addSubview(target)

//subbuttonを押した時に動く関数pushbutton*(1~4)をsubbuttonと紐付ける処理？
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
    
    
    
    //各ボタンを押した時の操作をここに記述する
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
