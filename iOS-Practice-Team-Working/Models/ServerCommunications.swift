//
//  ServerCommunications.swift
//  iOS-Practice-Team-Working
//
//  Created by reiji kobayashi on 2019/07/18.
//  Copyright © 2019 reud. All rights reserved.
//

import Foundation
import Alamofire


// サービス企画書 6 API 用の構造体
struct Position:Codable {
    let latitude:Float
    let longitude:Float
}

// サービス企画書 6 API 用の構造体
struct UserData:Codable {
    let id:String
    let position:Position
}

// サービス企画書 6 API 用の構造体
struct PostData:Codable {
    let genre:String
    let sukimaTime:Int
    let userData:UserData
}

// サービス企画書 6 API 用の構造体
struct LocationData:Codable {
    let position:Position
    let sukimatime:Int
    let name:String
    let genre:String
}

// サービス企画書 6 API 用の構造体
struct Result:Codable {
    let locationData:[LocationData]
}

// Sample
// https://github.com/2019-miraikeitai-org/ap_2_iOS_Alamofire-Practice
// Alamofire-Practiceに使ったパラメータの構造体化
struct PracticeRequestParam:Codable {
    let key:String
    let message:String
}

struct PracticeResultParam:Codable {
    let result:String
    let reply:String
}




// リクエストと結果の構造体を結びつけるプロトコル
// これにより、めっちゃ型安全かつ簡単にJSONが扱える・・・・はず
protocol Communicator{
    associatedtype REQUEST:Codable // Codableを継承している型がREQUESTに入るよ！
    associatedtype RESULT:Codable // Codableを継承している型がRESULTに入るよ！ (ジェネリクス swift でググれば多分理解できる)
    var endpointUrl:String {get}
    var request:REQUEST {get}
    var result:RESULT? {get}
    var method:HTTPMethod {get}
}
// requestメソッドは一々定義したくないのでextensionで実装
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



    
// Encodableの拡張、Encodableを拡張したものがCodableのため、実質Codableの拡張でもある。これはCodableプロトコルを満たす構造体をJSON(辞書型)として取得するメソッド
extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}



