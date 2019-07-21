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
    
    class CommunicatorExample: Communicator{
        let request: PracticeRequestParam
        let result: PracticeResultParam?
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
        guard let key = env["KEY"] else {
            fatalError(".env KEY param not found")
        }
        guard let url = env["ENDPOINT_URL"] else {
            fatalError(".env ENDPOINT_URL param not found")
        }
        let pr = PracticeRequestParam(key: key, message: "Hello World")
        CommunicatorExample(url: url, param: pr).request {
            res,err in
            guard let re = res else {
                self.textView.text = err!
                return
            }
            self.textView.text = re?.reply
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
