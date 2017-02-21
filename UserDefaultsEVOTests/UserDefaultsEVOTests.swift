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
        case bool
        case int
        case float
        case double
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
    
    func testBool() {
        let value = true
        if UserDefaults.TestData.bool.storedBool {
            assertionFailure("should be nil")
        }
        UserDefaults.TestData.bool.store(value: value)
        let storeValue = UserDefaults.TestData.bool.storedBool
        UserDefaults.TestData.bool.removed()
        assert(storeValue)
    }

    func testInt() {
        let value = 28
        if UserDefaults.TestData.int.storedInt != 0 {
            assertionFailure("should be nil")
        }
        UserDefaults.TestData.int.store(value: value)
        let storeValue = UserDefaults.TestData.int.storedInt
        UserDefaults.TestData.int.removed()
        assert(storeValue == value)
    }
    
    func testFloat() {
        let value: Float = 28.1
        if UserDefaults.TestData.float.storedInt != 0 {
            assertionFailure("should be nil")
        }
        UserDefaults.TestData.float.store(value: value)
        let storeValue = UserDefaults.TestData.float.storedFloat
        UserDefaults.TestData.float.removed()
        assert(storeValue == value)
    }
    
    func testDouble() {
        let value: Double = 28.2
        if UserDefaults.TestData.double.storedDouble != 0 {
            assertionFailure("should be nil")
        }
        UserDefaults.TestData.double.store(value: value)
        let storeValue = UserDefaults.TestData.double.storedDouble
        UserDefaults.TestData.double.removed()
        assert(storeValue == value)
    }
}
