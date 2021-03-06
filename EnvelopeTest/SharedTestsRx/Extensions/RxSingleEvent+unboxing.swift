//
//  RxSingleEvent+unboxing.swift
//  EnvelopeNetworkRx-ios-tests
//
//  Created by Ivan Misuno on 24-01-2018.
//  Copyright © 2018. All rights reserved.
//

import RxSwift

public extension SingleEvent {

    public var value: Element? {
        switch self {
        case .success(let value):
            return value
        case .error:
            return nil
        }
    }

    public var error: Error? {
        switch self {
        case .success:
            return nil
        case .error(let error):
            return error
        }
    }
}
