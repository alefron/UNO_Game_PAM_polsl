//
// UserAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire


open class UserAPI {
    /**
     Delete user by id

     - parameter _id: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteUser(_id: Int64, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteUserWithRequestBuilder(_id: _id).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Delete user by id
     - DELETE /users/{id}
     - 

     - parameter _id: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func deleteUserWithRequestBuilder(_id: Int64) -> RequestBuilder<Void> {
        var path = "/users/{id}"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Get user by specyfic id

     - parameter _id: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getUserById(_id: Int64, completion: @escaping ((_ data: User?,_ error: Error?) -> Void)) {
        getUserByIdWithRequestBuilder(_id: _id).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get user by specyfic id
     - GET /users/{id}
     - 

     - examples: [{contentType=application/json, example={
  "avatarUrl" : "avatarUrl",
  "losesCount" : 1,
  "winningCount" : 6,
  "id" : 0,
  "login" : "login"
}}]
     - parameter _id: (path)  

     - returns: RequestBuilder<User> 
     */
    open class func getUserByIdWithRequestBuilder(_id: Int64) -> RequestBuilder<User> {
        var path = "/users/{id}"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<User>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Endpoint for get all users

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getUsers(completion: @escaping ((_ data: [User]?,_ error: Error?) -> Void)) {
        getUsersWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Endpoint for get all users
     - GET /users
     - 

     - examples: [{contentType=application/json, example=[ {
  "avatarUrl" : "avatarUrl",
  "losesCount" : 1,
  "winningCount" : 6,
  "id" : 0,
  "login" : "login"
}, {
  "avatarUrl" : "avatarUrl",
  "losesCount" : 1,
  "winningCount" : 6,
  "id" : 0,
  "login" : "login"
} ]}]

     - returns: RequestBuilder<[User]> 
     */
    open class func getUsersWithRequestBuilder() -> RequestBuilder<[User]> {
        let path = "/users"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<[User]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
}
