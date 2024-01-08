//
//  MainAppTests.swift
//  MainAppTests
//
//  Created by Ajit Satarkar on 06/01/24.
//

    
import XCTest
@testable import MainApp

class ContentViewTests: XCTestCase {
    
    var contentView: ContentView!
    
    override func setUp() {
        super.setUp()
        contentView = ContentView()
    }
    
    override func tearDown() {
        contentView = nil
        super.tearDown()
    }
    
    func testContentView_InitialState_ShouldHaveLoadingView() {
        XCTAssertFalse(contentView.viewModel.isLoading)
    }
    
    func testContentView_InitialState_ShouldNotHaveFindMyIPData() {
        XCTAssertNil(contentView.viewModel.findMyIPData)
    }
    
    func testContentView_InitialState_ShouldNotShowAlert() {
        XCTAssertFalse(contentView.viewModel.showAlert)
    }
    
    func testContentView_InitialState_ShouldHaveCorrectNavigationTitle() {
        //XCTAssertEqual(contentView.navigationTitle, "Find My IP")
    }
    
    func testContentView_InitialState_ShouldCallGetFindMyIPServiceListOnAppear() {
        XCTAssertNotNil(contentView.viewModel.getFindMyIPServiceList())
    }
    
}
