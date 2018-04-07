//
//  NetworkRequestor.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 4..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Alamofire

struct NetworkRequestor {
    
    private static let manager = Alamofire.SessionManager.default
    
    typealias Completion = ((Json?, Error?) -> Void)?
    static func request(_ api: APIRouter, completion: Completion) {
        requestInfoLog(about: api)
        manager.session.configuration.timeoutIntervalForRequest = 15
        manager.request(api.requestUrl, method: api.endPoint.method, parameters: api.parameters, headers: api.headers)
        .validate()
        .responseJSON { response in
            switch response.result {
            case .success:
                successLog(about: response)
                if let data = response.data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Json
                        completion?(json, nil)
                    } catch(let error) {
                        completion?(nil, error)
                    }
                }
            case .failure(let error):
                failureLog(about: response)
                completion?(nil, error)
            }
        }
    }
    static func requestUpload(_ api: APIRouter, completion: Completion) {
        requestInfoLog(about: api)
        manager.upload(multipartFormData: { multipartFormData in
            api.parameters?.forEach {
                if let data = ($0.value as? Data) {
                    multipartFormData.append(data, withName: $0.key)
                } else if let data = ($0.value as? String)?.data(using: .utf8) {
                    multipartFormData.append(data, withName: $0.key)
                }
            }
        }, to: api.requestUrl, method: api.endPoint.method) { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseData { response in
                    switch response.result {
                    case .success:
                        successLog(about: response)
                        if let data = response.data {
                            do {
                                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Json
                                completion?(json, nil)
                            } catch(let error) {
                                completion?(nil, error)
                            }
                        }
                    case .failure(let error):
                        failureLog(about: response)
                        completion?(nil, error)
                    }
                }
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
}

private extension NetworkRequestor {
    
    static func requestInfoLog(about api: APIRouter) {
        LBLogger.debug(.minseob, "[API 요청 URL] \(api.requestUrl) \n" +
            "[API 요청 headers] \(api.headers ?? [:])" +
            "[API 요청 body] \(api.parameters ?? [:])")
    }
    
    static func successLog<T>(about response: DataResponse<T>) {
        if let data = response.data, let jsonString = String(data: data, encoding: .utf8) {
            LBLogger.debug(.minseob, "API 성공 응답 : \(response.response?.statusCode ?? 0), \(jsonString)")
        }
    }
    
    static func failureLog<T>(about response: DataResponse<T>) {
        if let data = response.data, let jsonString = String(data: data, encoding: .utf8) {
            LBLogger.debug(.minseob, "API 실패 응답 : \(response.response?.statusCode ?? 0), \(jsonString)")
        }
    }
}

