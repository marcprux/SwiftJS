//
//  SwiftJSTest.swift
//
//  The MIT License
//  Copyright (c) 2015 - 2020 Susan Cheng. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import SwiftJS
import XCTest

class SwiftJSTest: XCTestCase {
    
    func testCalculation() {
        
        let context = JSContext()
        
        do {
            
            let result = try context.evaluateScript("1 + 1")
            
            XCTAssertTrue(result.isNumber)
            XCTAssertEqual(result.doubleValue, 2)
            
        } catch let error {
            
            print(error)
            XCTFail()
        }
    }
    
    func testArray() {
        
        let context = JSContext()
        
        do {
            
            let result = try context.evaluateScript("[1 + 2, \"BMW\", \"Volvo\"]")
            
            XCTAssertTrue(result.isArray)
            
            let length = result.value(forProperty: "length")
            XCTAssertEqual(length.doubleValue, 3)
            
            XCTAssertEqual(result.value(at: 0).doubleValue, 3)
            XCTAssertEqual(result.value(at: 1).stringValue, "BMW")
            XCTAssertEqual(result.value(at: 2).stringValue, "Volvo")
            
        } catch let error {
            
            print(error)
            XCTFail()
        }
    }
    
}
