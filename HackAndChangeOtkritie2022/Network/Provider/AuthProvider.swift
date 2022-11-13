//
//  AuthProvider.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 12.11.2022.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay
import Alamofire



class AuthNetworkProvider {
    class func login(number: String, password: String) -> Void{
        let parameters = ["login": number, "password": password]
        var request = AF.request("https://hack.invest-open.ru/auth", method: .post, parameters: parameters, encoding: JSONEncoding.default)
        request.responseJSON{response in
            print(response)
            
        }
        print(request)
        print(URLEncoding.httpBody)
    }
    
    public struct AuthModel: Codable {
        
        public let userId: Int
        public let login: String
        public let role: String
        public let jwtToken: String
        
        private enum CodingKeys: String, CodingKey {
            case userId = "userId"
            case login = "login"
            case role = "role"
            case jwtToken = "jwtToken"
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            userId = try container.decode(Int.self, forKey: .userId)
            login = try container.decode(String.self, forKey: .login)
            role = try container.decode(String.self, forKey: .role)
            jwtToken = try container.decode(String.self, forKey: .jwtToken)
        }
    }
    
}

//extension AuthModel {
//    func toJSON() -> [String: Any] {
//        return [
//            "uId": userId,
//            "email": email,
//            "accessToken": accessToken,
//            "refreshToken": refreshToken
//        ]
//    }
//}
    

