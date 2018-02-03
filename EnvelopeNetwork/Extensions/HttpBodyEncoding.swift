//
//  HttpBodyEncoding.swift
//  Envelope-ios
//
//  Created by Ivan Misuno on 24-01-2018.
//  Copyright © 2018. All rights reserved.
//

import Alamofire

public final class HttpBodyEncoding: ParameterEncoding {

    public let httpBody: Data
    public let contentType: String
    public let defaultParametersEncoding: ParameterEncoding

    public init(httpBody: Data, contentType: String = "application/octet-stream", defaultParametersEncoding: ParameterEncoding = URLEncoding.methodDependent) {
        self.httpBody = httpBody
        self.contentType = contentType
        self.defaultParametersEncoding = defaultParametersEncoding
    }

    // MARK: - ParameterEncoding
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()

        if let parameters = parameters {
            urlRequest = try defaultParametersEncoding.encode(urlRequest, with: parameters)
        }

        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
        }

        urlRequest.httpBody = httpBody

        return urlRequest
    }
}
