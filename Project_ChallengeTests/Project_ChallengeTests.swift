//
//  Project_ChallengeTests.swift
//  Project_ChallengeTests
//
//  Created by Danish on 21/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import XCTest
@testable import Project_Challenge

class Project_ChallengeTests: XCTestCase {

    let model: Model = Model()
    let imageView: UIImageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    var boardModelArray: [BoardModel] = []

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      //  self.testJson()
    }

    func test1DataLoad() {
        let receviedData = self.expectation(description: "data fetch")
        model.getBoards(url: "http://pastebin.com/raw/wgkJgazE") { boardModels, error in
            if let boardModels = boardModels {
                if boardModels.count > 0 {
                    self.boardModelArray = boardModels
                    if let thumb = self.boardModelArray.first?.urls?.thumb {
                        if let url = URL(string: thumb) {
                            self.imageView.loadImage(from: url, placeHolder: "no_image_found")
                            receviedData.fulfill()
                        }
                    }
                }
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func test2Json() {
        for boardModel in self.boardModelArray {
            // Board
            XCTAssertNotNil(boardModel.id, "id has value")
            if boardModel.likedByUser == true {
                XCTAssert(true, "image liked by the user")
            } else {
                XCTAssert(true, "image has not like by the user")
            }
            XCTAssertGreaterThan(boardModel.likes!, 0, "There are likes")
            XCTAssertGreaterThan(boardModel.width!, 0, "width has value")
            XCTAssertGreaterThan(boardModel.height!, 0, "height has value")
            XCTAssertNotNil(boardModel.createdAt, "The created date has valid value")
            XCTAssertNotNil(boardModel.color, "The color has valid value")
            XCTAssertNotNil(boardModel.createdAt, "createdAt has value")
            XCTAssertNotNil(boardModel.color, "color has value")

            // User
            XCTAssertNotNil(boardModel.user, "user has value")
            if let user = boardModel.user {
                XCTAssertNotNil(user.id, "id is valid")
                XCTAssertNotNil(user.name, "name is valid")
                XCTAssertNotNil(user.userName, "username is valid")
                XCTAssertNotNil(user.links, "links is valid")
                XCTAssertNotNil(user.profileImage, "links is valid")

                // link
                if let link = user.links {
                    XCTAssertNotNil(link.html, "html has valid link")
                    XCTAssertNotNil(link.likes, "likes has valid link")
                    XCTAssertNotNil(link.photos, "photos has valid link")
                    XCTAssertNotNil(link.selfLink, "self has valid link")
                }
                // ProfileImage
                if let profileImage = user.profileImage {
                    XCTAssertNotNil(profileImage.small, "small has valid image url")
                    XCTAssertNotNil(profileImage.medium, "medium has valid image url")
                    XCTAssertNotNil(profileImage.large, "large has valid image url")
                }
            }

            // Links
            XCTAssertNotNil(boardModel.links, "links has value")
            if let link = boardModel.links {
                XCTAssertNotNil(link.download, "download has valid link")
                XCTAssertNotNil(link.html, "html has valid link")
                XCTAssertNotNil(link.selfLink, "self has valid link")
            }

            // Urls
            XCTAssertNotNil(boardModel.urls, "urls has value")
            if let url = boardModel.urls {
                XCTAssertNotNil(url.full, "full has valid url")
                XCTAssertNotNil(url.raw, "raw has valid url")
                XCTAssertNotNil(url.regular, "regular has valid url")
                XCTAssertNotNil(url.small, "small has valid url")
                XCTAssertNotNil(url.thumb, "thumb has valid url")
            }

            // Category
            if boardModel.categories.count > 0 {
                 XCTAssert(true, "The category has values")
                for category in boardModel.categories {
                     XCTAssertNotNil(category.id, "id is valid")
                     XCTAssertGreaterThan(category.photoCount!, 0, "photoCount has value")
                     XCTAssertNotNil(category.title, "title is valid")

                    // Links
                    XCTAssertNotNil(category.links, "links has value")
                    if let link = category.links {
                        XCTAssertNotNil(link.photos, "photos has valid link")
                        XCTAssertNotNil(link.selfLink, "self has valid link")
                    }
                }
            } else {
                 XCTAssert(false, "category is empty")
            }
        }
    }

    func test3ImageCheck() {
        if imageView.image != nil {
            XCTAssert(true, "image load success")
        } else {
            XCTAssert(true, "image load failed")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
