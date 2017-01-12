//
//  URLBlock.swift
//  URLBlock
//
//  Created by Wayne Yeh on 2017/1/12.
//  Copyright © 2017年 Wayne Yeh. All rights reserved.
//

import UIKit

protocol URLBlockDelegate: class {
    func canBlock(url: URL) -> Bool
}

class URLBlock: URLProtocol {
    
    private static weak var _delegate: URLBlockDelegate?
    static weak var delegate: URLBlockDelegate? {
        set {
            URLProtocol.registerClass(self)
            _delegate = newValue
        }
        get {
            return _delegate
        }
    }

    override class func canInit(with request: URLRequest) -> Bool {
        guard let function = delegate, let url = request.url else {
            return false
        }
        
        return function.canBlock(url: url)
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest{
        return request;
    }
    
    override func startLoading() {
        self.client?.urlProtocol(self, didLoad: Data())
    }
    
    override func stopLoading() {
    }
}
