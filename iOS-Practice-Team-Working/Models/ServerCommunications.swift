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

struct PracticeRequestHeader:Codable {
    
}




class ServerController {
    private let endpointUrl:String
    private let headers: HTTPHeaders = [
        "Content-Type":"application/json"
    ]
    init(){
        let env = ProcessInfo.processInfo.environment
        guard let endpointUrl = env["ENDPOINT_URL"] else {
            fatalError(".env reading failed: endpointUrl is nil")
        }
        self.endpointUrl = endpointUrl
    }
    
    func practiceRequest(p:PracticeRequestParam,completion: @escaping (String) -> Void) {
        do {
            let d = try p.asDictionary()
            AF.request(self.endpointUrl,method: .post, parameters: d, encoding: URLEncoding.default,headers: self.headers).responseString {
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



