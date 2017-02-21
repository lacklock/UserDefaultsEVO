//
//  UserDefaultsEVO.swift
//  UserDefaultsEVO
//
//  Created by 卓同学 on 2017/2/21.
//  Copyright © 2017年 卓同学. All rights reserved.
//

import Foundation


public protocol UserDefaultSettable {
    var uniqueKey: String { get }
}

public extension UserDefaultSettable where Self: RawRepresentable, Self.RawValue == String {
    
    public func store(value: Any?){
        UserDefaults.standard.set(value, forKey: uniqueKey)
    }
    
    public var storedValue: Any? {
        return UserDefaults.standard.value(forKey: uniqueKey)
    }
    
    public var storedString: String? {
        return storedValue as? String
    }
    
    public func store(url: URL?) {
        UserDefaults.standard.set(url, forKey: uniqueKey)
    }
    
    public var storedURL: URL? {
        return UserDefaults.standard.url(forKey: uniqueKey)
    }
    
    public var uniqueKey: String {
        return "\(Self.self).\(rawValue)"
    }
    
    /// removed object from standard userdefaults
    public func removed() {
        UserDefaults.standard.removeObject(forKey: uniqueKey)
    }

}
