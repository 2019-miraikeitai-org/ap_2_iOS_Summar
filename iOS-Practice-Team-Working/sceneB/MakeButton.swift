//ここで新しいボタンの作成およびアニメーションの動作を記述してます

import Foundation
import UIKit


//subボタンについてのクラス

struct SubButton {
    var subButtonUI = UIButton()
    var buttonNumber : Int
    
}

class NewButton  {
    
    //subボタンに基本的な形を与える関数
    //この関数使えば丸いボタンがmainbuttonの後ろに配置されるようになっている
    class func  makeButton (original : UIButton , target :UIButton)   {
        
        //mainボタンの座標及び幅を取得する
        let target_x = original.frame.origin.x
        let target_y = original.frame.origin.y
        let target_size = original.frame.size.width
        
        //表示されるテキスト
        target.setTitle("tap me" , for: .normal)
        
        //テキストの色
        target.setTitleColor(UIColor.blue, for: .highlighted)
        
        //タップした状態のテキスト
        target.setTitle("Tapped!", for: .highlighted)
        
        //タップした状態の色
        target.setTitleColor(UIColor.red, for: .highlighted)
        
        //サイズ
        //mainbuttonより若干小さくなるようになってる
        target.frame = CGRect(x: (target_x + target_size * 0.5), y: (target_y + target_size * 0.5), width: 60 , height: 60 )
        
        
        //配置場所
        //これはmainbuttonの後ろに来るようになっている
        target.layer.position = CGPoint(x:( target_x + target_size * 0.5)  , y:(target_y + target_size * 0.5))
        
        //背景色
        target.backgroundColor = UIColor(red: 0.7, green: 0.2, blue: 0.2, alpha: 0.2)
        
        //角丸
        target.layer.cornerRadius = 30
        
        //ボーダー幅
        target.layer.borderWidth = 1
        
    }
    
    
    
    //mainボタンを押したらmainボタンの後ろに戻るアニメーションの追加
    //mainbuttonが奇数回目に押された時はsubbuttonがmainbuttonの後ろから現れるアニメーションをするようになる
    //mainbuttonが偶数回目に押された時はsubbuttonがmainbuttonの後ろへ隠れるアニメーションをするようになる
    //三角関数使ってボタンの移動を行っている。subbuttonの個数を変更してもうまくアニメーションされるはず
    class func animation  (animation : UIButton ,Countbutton : Int ,buttonNumber : Int , Counter: Bool) {
        
        //counterの真偽によってsignの値を1と-1の間で変更
        var sign :Float = 1.0
        if Counter  {sign = -1.0}
   
        //アニメーションするsubボタンの座標を取得
        animation.center = CGPoint(x:animation.frame.origin.x + (animation.frame.size.width * 0.5), y:animation.frame.origin.y + (animation.frame.size.width * 0.5))
        
        
        let size :Float = 90.0 //飛び出す大きさの目安
        let rad :Float = (5.0/6.0 * Float.pi / Float((Countbutton - 1)) * Float((Countbutton - buttonNumber))) //動き出す角度を計算する
        //x方向に動く大きさを記述
        //奇数回目のときはCounterに渡される値は-1で、偶数回目のときはCounterは1で方向を逆にしている
        let chenge_x :CGFloat = CGFloat(sign * size * -cos(rad - (Float.pi / 6.0)))
        
        //ｙ方向に動く大きさを記述
        //奇数回目のときはCounterに渡される値は-1で、偶数回目のときはCounterは1で方向を逆にしている
        let chenge_y :CGFloat = CGFloat(sign * size * sin(rad - (Float.pi / 6.0)))
        
        
        //animationさせる
        UIView.animate(withDuration: 0.25, delay: 0.0, animations: {animation.center.x += chenge_x ; animation.center.y += chenge_y}, completion: nil)
        
    }
}

