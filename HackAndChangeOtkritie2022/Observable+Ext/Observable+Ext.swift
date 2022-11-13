//
//  Observable+Ext.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 13.11.2022.
//

import Foundation
import RxSwift
import RxCocoa

//public enum ApiResult<Value, Error>{
//    case success(Value)
//    case failure(Error)
//    
//    init(value: Value){
//        self = .success(value)
//    }
//    
//    init(error: Error){
//        self = .failure(error)
//    }
//}
//
//public struct ApiErrorMessage: Codable{
//    let error_message: String
//}
//
//extension Observable where Element == (HTTPURLResponse, Data){
//    func expectingObject<T : Codable>(ofType type: T.Type) -> Observable<ApiResult<T, ApiErrorMessage>>{
//        return self.map{ (httpURLResponse, data) -> ApiResult<T, ApiErrorMessage> in
//            switch httpURLResponse.statusCode{
//            case 200 ... 299:
//                let object = try JSONDecoder().decode(type, from: data)
//                return .success(object)
//            default:
//                let apiErrorMessage: ApiErrorMessage
//                
//                do {
//                    let result = try JSONDecoder().decode(AuthModel.self, from: data)
//                    apiErrorMessage = ApiErrorMessage(error_message: result.message)
//                } catch _ {
//                    apiErrorMessage = ApiErrorMessage(error_message: "Something went wrong. Please try again later.")
//                }
//                
//                return .failure(apiErrorMessage)
//            }
//        }
//    }
//}
//
//extension ObservableType where Element == Bool {
//    /// Boolean not operator
//    public func not() -> Observable<Bool> {
//        return self.map(!)
//    }
//    
//}
//
//extension SharedSequenceConvertibleType {
//    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
//        return map { _ in }
//    }
//}
//
//extension ObservableType {
//    
//    func catchErrorJustComplete() -> Observable<Element> {
//        return catchError { _ in
//            return Observable.empty()
//        }
//    }
//    
//    func asDriverOnErrorJustComplete() -> Driver<Element> {
//        return asDriver { error in
//            return Driver.empty()
//        }
//    }
//    
//    func mapToVoid() -> Observable<Void> {
//        return map { _ in }
//    }
//}
//
