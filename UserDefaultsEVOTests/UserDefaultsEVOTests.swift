//
//  UserDefaultsEVOTests.swift
//  UserDefaultsEVOTests
//
//  Created by 卓同学 on 2017/2/21.
//  Copyright © 2017年 卓同学. All rights reserved.
//

import XCTest
@testable import UserDefaultsEVO

extension UserDefaults {
    enum TestData: String,UserDefaultSettable {
        case name
        case url
    }
}

class UserDefaultsEVOTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testStringValue() {
        let value = "testValue"
        if let _ = UserDefaults.TestData.name.storedString {
            assertionFailure("should be nil")
        }
        UserDefaults.TestData.name.store(value: value)
        guard let storeValue = UserDefaults.TestData.name.storedString else {
            assertionFailure()
            return
        }
        UserDefaults.TestData.name.removed()
        assert(storeValue == value)
    }
    
    func testURL() {
        let value = URL(string: "lacklock@gmail.com")!
        if let _ = UserDefaults.TestData.url.storedURL {
            assertionFailure("should be nil")
        }
        UserDefaults.TestData.url.store(url: value)
        guard let storeValue = UserDefaults.TestData.url.storedURL else {
            assertionFailure()
            return
        }
        UserDefaults.TestData.url.removed()
        assert(storeValue.absoluteString == value.absoluteString)
    }

}
