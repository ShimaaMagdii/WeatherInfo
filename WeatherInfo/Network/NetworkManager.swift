//
//  NetworkManager.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import UIKit
import Alamofire

typealias SuccessNetworkClousre = (Any?)  -> Void
typealias FailureNetworkClousre = (_ error: NSError) -> Void

public class NetworkManager {
    
    /**
     Requests data from API and get the response back.
     
     - Parameter baseURL: Base URL for the API..
     - Parameter path: API path.
     - Parameter requestMethod: request method .GET .POST etc..
     - Parameter parameters: request parameters.
     - Parameter headers: request headers.
     - Parameter parameterEncoding:  The parameter encoding. `URLEncoding.default`.
     - Parameter success: response success block.
     - Parameter failure: response failure block.
     */
    
    class func performRequestWithPath (baseUrl          :String = ServiceUrls.BASE_URL,
                                       path             :String?,
                                       requestMethod    :Alamofire.HTTPMethod,
                                       requestParam     :[String: Any]?,
                                       headersParam     :[String: String]?,
                                       parameterEncoding: ParameterEncoding = JSONEncoding.default,
                                       success          :@escaping SuccessNetworkClousre,
                                       failure          :@escaping FailureNetworkClousre){
        
        let url = (path != nil) ? baseUrl + path! : baseUrl
       
            Alamofire.request(URL.init(string: url)!, method: requestMethod, parameters: requestParam, encoding: parameterEncoding, headers: headersParam)
                .validate()
                .responseJSON { (response) in
                    switch response.result {
                    case  .success(_):
                        success(response.result.value)
                    case .failure(let error):
                        failure(error as NSError)
                    }
            }
    }
}

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}
