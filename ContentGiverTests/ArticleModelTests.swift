//
//  ArticleModelTest.swift
//  ContentGiverTests
//
//  Created by Ayslana Riene on 24/10/22.
//

import XCTest

final class ArticleModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testUserFormModel_canCreateInstance() {
        let instance
        = ArticleModel(author: "Author Test",
                       title: "Title Test",
                       description: "Description Test")
        XCTAssertNotNil(instance)
    }
    
    func testArticleModel_ShouldPassIfValidateAuthor() {
        let articleModel = ArticleModel(author: "Author Test",
                                        title: "Title Test",
                                        description: "Description Test")
        XCTAssertTrue(articleModel.isValidFirstName())
    }
    
}
