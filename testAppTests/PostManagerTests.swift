//
//  PostManagerTests.swift
//  testAppTests
//
//  Created by Macbook on 31/10/23.
//

import XCTest
@testable import testApp

class PostManagerTests: XCTestCase {
    
    var postManager: PostManager!
    
    override func setUp() {
        super.setUp()
        postManager = PostManager()
    }
    
    override func tearDown() {
        postManager = nil
        super.tearDown()
    }
    
    func testGetPosts_Success() async {
        let mockApiManager = MockApiManager()
        let mockDBManager = MockDBManager()
        postManager.api = mockApiManager
        postManager.db = mockDBManager
        
        do {
            let customPosts = try await postManager.getPosts()
            XCTAssertEqual(customPosts.count, 2, "Expected 2 custom posts")
            XCTAssertEqual(customPosts[0].post!.title, "Post 0", "Expected correct data from Post 0")
            XCTAssertEqual(customPosts[1].album!.url, "url1", "Expected correct data from Album 1")
            XCTAssertEqual(customPosts[1].videoURL.isEmpty, false, "Expected some value added")
        } catch {
            XCTFail("Error: \(error)")
        }
    }
    
    func testGetPosts_Failure() async {
        let mockApiManager = MockApiManager()
        let mockDBManager = MockDBManager()
        mockApiManager.throwError = true
        postManager.api = mockApiManager
        postManager.db = mockDBManager
        
        do {
            let _ = try await postManager.getPosts()
            XCTFail("Expected error")
        } catch {
            XCTAssertEqual(error.networkError.isInternetError, false, "Expected unknown Error")
        }
    }
    
    func testGetPosts_NetworkFailure() async {
        let mockApiManager = MockApiManager()
        let mockDBManager = MockDBManager()
        postManager.api = mockApiManager
        postManager.db = mockDBManager
        
        do {
            let customPosts = try await postManager.getPosts()
            XCTAssertEqual(customPosts.count, 2, "Expected 2 custom posts")
        } catch {
            XCTFail("Error: \(error)")
        }
        
        mockApiManager.throwInternetError = true
        
        do {
            let customPosts = try await postManager.getPosts()
            XCTAssertEqual(customPosts.count, 2, "Expected 2 custom posts from db")
        } catch {
            XCTFail("Error: \(error)")
        }
    }
}

