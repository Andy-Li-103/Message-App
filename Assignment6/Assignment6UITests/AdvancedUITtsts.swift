import XCTest

final class AdvancedUITtsts: XCTestCase {

  private var app: XCUIApplication!

  override func setUpWithError() throws {
    try super.setUpWithError()
    continueAfterFailure = false
    app = XCUIApplication()
    app.launch()
  }
  
  private func waitFor(_ element : XCUIElement, timeout: Double = 5.0) -> XCUIElement{
    let expectation = expectation(
      for: NSPredicate(format: "exists == true"),
      evaluatedWith: element,
      handler: .none
    )
    let _ = XCTWaiter.wait(for: [expectation], timeout: timeout)
    return element
  }
  
  private func login(_ email: String = "ali103@ucsc.edu", passwd: String = "1755575") {
    let email = app.textFields["EMail"]
    email.tap()
    email.typeText("ali103@ucsc.edu")
    let password = app.secureTextFields["Password"]
    password.tap()
    password.typeText(passwd)
    app.buttons["Login"].tap()
  }
  
  func makeWorkspace(name: String) {
    waitFor(app.navigationBars["Workspaces"].buttons["New Workspace"]).tap()
    
    XCTAssert(waitFor(app.navigationBars["New Workspace"]).exists)
    let input = app.textFields["Name"]
    input.tap()
    input.typeText(name)
    app.buttons["OK"].tap()
    XCTAssert(waitFor(app.collectionViews.buttons[name]).exists)
//    waitFor(app.collectionViews.buttons[name]).tap()
  }
  
  func deleteWorkspace(name: String) {
    XCTAssert(waitFor(app.collectionViews.buttons[name]).exists)
    app.staticTexts[name].swipeLeft()
    app.buttons["Delete"].tap()
    XCTAssertFalse(app.staticTexts[name].exists)
  }
  
  func makeChannel(workspace: String, name: String) {
    waitFor(app.navigationBars[workspace].buttons["New Channel"]).tap()
    
    XCTAssert(waitFor(app.navigationBars["New Channel"]).exists)
    let input = app.textFields["Name"]
    input.tap()
    input.typeText(name)
    app.buttons["OK"].tap()
    XCTAssert(waitFor(app.collectionViews.buttons[name]).exists)
  }
  
  func deleteChannel(name: String) {
    XCTAssert(waitFor(app.collectionViews.buttons[name]).exists)
    app.staticTexts[name].swipeLeft()
    app.buttons["Delete"].tap()
    XCTAssertFalse(app.staticTexts[name].exists)
  }
  
  func addNewMember(workspace: String, name: String){
    waitFor(app.navigationBars[workspace].buttons["Add Members"]).tap()
    waitFor(app.navigationBars["Members"].buttons["Add Member"]).tap()
    
    XCTAssert(waitFor(app.staticTexts[name]).exists)
    app.staticTexts[name].swipeLeft()
    app.buttons["Add"].tap()
//    waitFor(app.navigationBars["Members"].buttons["Members"]).tap()
    XCTAssert(waitFor(app.staticTexts[name]).exists)
  }
  
  func deleteMember(name: String) {
    XCTAssert(waitFor(app.staticTexts[name]).exists)
    app.staticTexts[name].swipeLeft()
    app.buttons["Delete"].tap()
    XCTAssertFalse(app.staticTexts[name].exists)
  }
  // Your tests go here
  
  func testWorkspaceAddDelete() throws {
    login()
    let workspace:String = "Test Workspace"
    makeWorkspace(name: workspace)
    deleteWorkspace(name: workspace)
  }
  
  func testChannelAddDelete() throws {
    login()
    let workspace:String = "Test Workspace"
    makeWorkspace(name: workspace)
    waitFor(app.collectionViews.buttons[workspace]).tap()
    let channel:String = "Test Channel"
    makeChannel(workspace: workspace, name: channel)
    deleteChannel(name: channel)
    app.navigationBars[workspace].buttons["Workspaces"].tap()
    deleteWorkspace(name: workspace)
  }
  
  func testMemberAddDelete() throws {
    let workspace:String = "Test Workspace"
    let member:String = "Anna Admin"
    login()
    
    makeWorkspace(name: workspace)
    waitFor(app.collectionViews.buttons[workspace]).tap()
    
    addNewMember(workspace: workspace, name: member)
    deleteMember(name: member)
    
    app.navigationBars["Members"].buttons[workspace].tap()
    waitFor(app.navigationBars[workspace].buttons["Workspaces"]).tap()
    
    deleteWorkspace(name: workspace)
  }
  

}

