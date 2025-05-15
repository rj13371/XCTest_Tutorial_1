//
//  SignUpViewControllerTests.swift
//  XCTest Tutorial 1Tests
//
//  Created by roland on 2025/05/15.
//

import XCTest
import ViewInspector
@testable import XCTest_Tutorial_1

final class SignUpViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUpViewController_WhenCreated_HasTextHelloWorld() throws {
        //arrange
        let sut = ContentView()
        //act
        let text = try sut.inspect().find(text: "Hello World!").string()
        //assert
        XCTAssertEqual(text,"Hello World!", "Expect Hello World to be present")
    }

}
