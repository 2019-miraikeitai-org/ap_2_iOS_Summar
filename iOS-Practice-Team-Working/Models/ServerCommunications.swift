//
//  ServerCommunications.swift
//  iOS-Practice-Team-Working
//
//  Created by reiji kobayashi on 2019/07/18.
//  Copyright © 2019 reud. All rights reserved.
//

import Foundation
import Alamofire
// サービス企画書 6 APIの構造体

// request params

struct Position:Codable {
    let latitude:Float
    let longitude:Float
}

struct UserData:Codable {
    let id:String
    let position:Position
}

struct PostData:Codable {
    let genre:String
    let sukimaTime:Int
    let userData:UserData
}

// result params
struct LocationData:Codable {
    let position:Position
    let sukimatime:Int
    let name:String
    let genre:String
}

struct Result:Codable {
    let locationData:[LocationData]
}

// Sample
// https://github.com/2019-miraikeitai-org/ap_2_iOS_Alamofire-Practice
// これに使ったパラメータの構造体化

struct PracticeRequestParam:Codable {
    let key:String
    let message:String
}

struct PracticeResultParam:Codable {
    let result:String
    let reply:String
}




// リクエストと結果の構造体を結びつける構造体
protocol Communicator{
    associatedtype REQUEST:Codable
    associatedtype RESULT:Codable
    var endpointUrl:String {get}
    var request:REQUEST {get}
    var result:RESULT {get}
    var method:HTTPMethod {get}
}

extension Communicator {
    func request(completion: @escaping (RESULT?,String?) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type":"application/json"
        ]
        let url = self.endpointUrl
        do {
            AF.request(url,method: method, parameters: try self.request.asDictionary(), encoding: JSONEncoding.default,headers: headers).responseJSON {
                response in
                switch response.result {
                case .success(_):
                    do{
                        guard let data = response.data else {
                            fatalError("unknown data received")
                        }
                        let re = try JSONDecoder().decode(RESULT.self,from: data)
                        completion(re,nil)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                case .failure(let err):
                    completion(nil,err.localizedDescription)
                }
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}


class ServerController {
    private let baseUrl:String
    private let headers: HTTPHeaders = [
        "Content-Type":"application/json"
    ]
    init(){
        let env = ProcessInfo.processInfo.environment
        guard let endpointUrl = env["ENDPOINT_URL"] else {
            fatalError(".env reading failed: endpointUrl is nil")
        }
        self.baseUrl = endpointUrl
    }
    
    // テスト用関数 (実際の開発では削除予定)
    func practiceRequest(p:PracticeRequestParam,additionalUrl: String = "",completion: @escaping (String) -> Void) {
        do {
            let d = try p.asDictionary()
            let url = self.baseUrl + additionalUrl
            AF.request(url,method: .post, parameters: d, encoding: JSONEncoding.default,headers: self.headers).responseString {
                response in
                switch response.result {
                case .success(let val):
                    completion(val)
                case .failure(let err):
                    completion(err.localizedDescription)
                }
            }

        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    
    
    // Codableプロトコルを継承した構造体のみをリクエストのパラメータとして許可する。
    // addtional URLはサーバ作成後,Enumに変更予定

    
    
}
extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}



