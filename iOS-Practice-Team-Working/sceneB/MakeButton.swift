//ここで新しいボタンの作成およびアニメーションの動作を記述してあります



import Foundation
import UIKit


//新しいボタンの作成
class newbutton : NSObject {
    class func  makebutton (original : UIButton , target :UIButton)   {
        
        
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
        target.frame = CGRect(x: (target_x + target_size * 0.5), y: (target_y + target_size * 0.5), width: 60 , height: 60 )
        
        
        //配置場所
        target.layer.position = CGPoint(x:( target_x + target_size * 0.5)  , y:(target_y + target_size * 0.5))
        
        //背景色
        target.backgroundColor = UIColor(red: 0.7, green: 0.2, blue: 0.2, alpha: 0.2)
        
        //角丸
        target.layer.cornerRadius = 30
        
        //ボーダー幅
        target.layer.borderWidth = 1
        
        
 
        
    }
    

    
    //mainボタンを押したら飛び出すアニメーションの追加
    class func animation  (animation : UIButton ,buttonNumber : Int) {
        
        animation.center = CGPoint(x:animation.frame.origin.x + (animation.frame.size.width * 0.5), y:animation.frame.origin.y + (animation.frame.size.width * 0.5))
        
        if buttonNumber == 1
        {
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {animation.center.x += -20; animation.center.y += -100}, completion: nil)
            
        }
        
        if  buttonNumber == 2
        {
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {animation.center.x += 50.0; animation.center.y += -95.0}, completion: nil)
        }
        
        if  buttonNumber == 3
        {
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {animation.center.x += 94.0; animation.center.y += -40.0}, completion: nil)
        }
        
        if buttonNumber == 4
        {
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {animation.center.x += 88.0; animation.center.y += 30.0}, completion: nil)
            
        }
        
    }
    
    //mainボタンを押したら戻るアニメーションの追加
    class func ranimation  (animation : UIButton ,buttonNumber :Int) {
        
        animation.center = CGPoint(x:animation.frame.origin.x + (animation.frame.size.width * 0.5), y:animation.frame.origin.y + (animation.frame.size.width * 0.5))
        
        if buttonNumber == 1
        {
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {animation.center.x -= -20; animation.center.y -= -100}, completion: nil)
            
        }
        
        if  buttonNumber == 2
        {
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {animation.center.x -= 50.0; animation.center.y -= -95.0}, completion: nil)
        }
        
        if  buttonNumber == 3
        {
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {animation.center.x -= 94.0; animation.center.y -= -40.0}, completion: nil)
        }
        
        if buttonNumber == 4
        {
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {animation.center.x -= 88.0; animation.center.y -= 30.0}, completion: nil)
            
        }
        
    }
    
}

