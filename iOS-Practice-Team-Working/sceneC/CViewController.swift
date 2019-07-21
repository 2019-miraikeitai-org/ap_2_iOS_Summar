//
//  CViewController.swift
//  iOS-Practice-Team-Working
//
//  Created by reiji kobayashi on 2019/06/27.
//  Copyright © 2019 reud. All rights reserved.
//

import UIKit
import Alamofire
class CViewController: UIViewController {
    var scm: ServerController!
    var env: [String:String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        scm = ServerController()
        env = ProcessInfo.processInfo.environment
        // Do any additional setup after loading the view.
    }
    
    
    // 作成したプロトコルの使用例
    // こんな感じで Communicatorプロトコルからクラスを自分で作成する
    // 既存部分から変える前提での書き方を下記に示す (多分こうなると思う)
    // class <好きな名前>: Communicator {
    //  let request: <リクエストに使う構造体>
    //  let result: <結果の受け取りに使う構造体>?
    //             (以下同じ)
    //             ....
    //             ....
    //             ....
    //
    //
    //
    //
    //
    class CommunicatorExample: Communicator{
        let request: PracticeRequestParam // リクエストに使う構造体を指定
        let result: PracticeResultParam? // 結果の受け取りに使う構造体を指定(?は必ず付けてください)
        let endpointUrl: String
        let method: HTTPMethod
        // 本当はプロトコルのextensionに書きたかった・・・ うまくいかず断念
        init(url:String,param:PracticeRequestParam,method: HTTPMethod = .post) {
            self.endpointUrl = url
            self.method = method
            self.request = param
            self.result = nil
        }
    }
    @IBOutlet weak var textView: UITextView!
    @IBAction func alamofireTestButtonPushed(_ sender: Any) {
        // envの確認
        guard let key = env["KEY"] else {
            fatalError(".env KEY param not found")
        }
        guard let url = env["ENDPOINT_URL"] else {
            fatalError(".env ENDPOINT_URL param not found")
        }
        // リクエストのパラメータの作成
        let pr = PracticeRequestParam(key: key, message: "Hello World")
        // 使用例: インスタンス作成してそのままメソッドでいいと思う。 こんな感じ
        // resにはresultの構造体のオプショナル, errはStringのオプショナルが入る
        CommunicatorExample(url: url, param: pr).request {
            res,err in
            // resはオプショナルなのでアンラップしよう
            guard let re = res else {
                // resがnilならerrは必ず not nilになるので強制アンラップしてます(定義参照)
                self.textView.text = err!
                return
            }
            self.textView.text = re.reply
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
