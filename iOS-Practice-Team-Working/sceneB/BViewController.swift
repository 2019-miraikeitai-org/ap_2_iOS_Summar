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
    
    
    //ここにsubbuttonの数countbuttonと,subbutton数だけUIButtonとidを持つ構造体SuButtonを定義する
    //buttonnumberはanimationして現れたとき左上から時計周りの順番で１から定義する
    let countButton = 4
    let subButton1 = SubButton( subButtonUI: UIButton(), buttonNumber: 1)
    let subButton2 = SubButton( subButtonUI: UIButton(), buttonNumber: 2)
    let subButton3 = SubButton( subButtonUI: UIButton(), buttonNumber: 3)
    let subButton4 = SubButton( subButtonUI: UIButton(), buttonNumber: 4)
    
    override func viewDidLoad() {
        
        //MakeButton.swift内に記述のnewbuttonクラスのmakebutton関数
        //ボタンの初期設定を行う
        //originalにはmainbuttonのUIviewを、targetには新しいsubbuttonのUIviewを引数にする
        NewButton.makeButton(original: MainButtonView, target :subButton1.subButtonUI)
        NewButton.makeButton(original: MainButtonView, target :subButton2.subButtonUI)
        NewButton.makeButton(original: MainButtonView, target :subButton3.subButtonUI)
        NewButton.makeButton(original: MainButtonView, target :subButton4.subButtonUI)
        
        
        //ボタンを画面に出現させ、ボタンを押した時の動作を加える関数
        //これはviewcontroller.swift内に関数が記述されている
        appearButton(target: subButton1.subButtonUI,number:subButton1.buttonNumber)
        appearButton(target: subButton2.subButtonUI,number:subButton2.buttonNumber)
        appearButton(target: subButton3.subButtonUI,number:subButton3.buttonNumber)
        appearButton(target: subButton4.subButtonUI,number:subButton4.buttonNumber)
        
        super.viewDidLoad()
        
        self.view.bringSubviewToFront(MainButtonView)
        
        // Do any additional setup after loading the view.
    }
    
    //counterをbool型に直しました
    var counter :Bool  = true
    
    //mainbuttonが押された時の内容がここに記述される
    @IBAction func MainButtonAction(_ sender: Any) {
        
        
        //MakeButton.swift内に記述のnewbuttonクラスのanimation関数でアニメーションできるようにする
        NewButton.animation(animation : subButton1.subButtonUI, Countbutton: countButton,buttonNumber: subButton1.buttonNumber, Counter :counter)
        NewButton.animation(animation : subButton2.subButtonUI, Countbutton: countButton,buttonNumber: subButton2.buttonNumber, Counter: counter)
        NewButton.animation(animation : subButton3.subButtonUI, Countbutton: countButton,buttonNumber: subButton3.buttonNumber, Counter: counter)
        NewButton.animation(animation : subButton4.subButtonUI, Countbutton: countButton,buttonNumber: subButton4.buttonNumber, Counter: counter)
        
        
        //Mainbuttonの押された回数が奇数か偶数を測定するところ
        //counterの真偽を変更
        counter = !counter
    }
    
    
    
    
    //画面上にsubbuttonが現れるようにする関数
    //MakeButton.swiftのnewbuttonクラス内にこの関数を入れたかったけどエラーが出たのでここに記述
    func appearButton (target :UIButton , number:Int){
        
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
