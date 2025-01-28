import XCTest

class PlungeUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    func testVerifyWelcomeToPlungeModal() {
        let getStartedButton = app.buttons["Getting started"]
        XCTAssertTrue(getStartedButton.waitForExistence(timeout: 5), "Welcome modal is not present.")
        
        if getStartedButton.exists {
            print("Welcome modal is present.")
            app.swipeUp()
        }
    }

    func testSwitchEnvironmentToUAT() {
        let secretButton = app.buttons.element(boundBy: 0) // Replace with the correct identifier
        let secretTextField = app.textFields.element(boundBy: 0) // Replace with the correct identifier
        let okButton = app.buttons["Ok"]
        let uatButton = app.buttons["UAT"] // Replace with correct identifier
        let saveButton = app.buttons["Save"] // Replace with correct identifier
        
        XCTAssert(secretButton.waitForExistence(timeout: 2), "Secret button not found.")
        
        for _ in 1...10 {
            if secretButton.exists {
                secretButton.tap()
            }
        }
        
        secretTextField.tap()
        secretTextField.typeText("YourSecretPassword")
        
        okButton.tap()
        uatButton.tap()
        saveButton.tap()
    }

    func testSignInWithEmailAndPassword() {
        let continueWithEmailButtonUAT = app.buttons["Continue with Email UAT"] // Replace with correct identifier
        let continueWithEmailButtonProd = app.buttons["Continue with Email Prod"] // Replace with correct identifier
        let emailField = app.textFields["Email"]
        let continueButton = app.buttons["Continue"]
        let passwordField = app.secureTextFields["Password"]
        let signInButton = app.buttons["Sign In"]
        
        if continueWithEmailButtonUAT.waitForExistence(timeout: 5) {
            continueWithEmailButtonUAT.tap()
        } else {
            continueWithEmailButtonProd.tap()
        }
        
        emailField.tap()
        emailField.typeText("test@example.com")
        continueButton.tap()
        
        passwordField.tap()
        passwordField.typeText("password123")
        signInButton.tap()
        
        XCTAssert(app.staticTexts["Streak"].exists, "Failed to sign in.")
    }

    func testSignOut() {
        let homeButton = app.buttons["Home"]
        let profileIcon = app.buttons["Profile Icon"]
        let signOutButton = app.buttons["Sign Out"]
        let confirmSignOutButton = app.buttons["Confirm"]
        
        homeButton.tap()
        profileIcon.tap()
        
        XCTAssert(app.staticTexts["Profile"].exists, "Profile screen not found.")
        app.swipeUp()
        signOutButton.tap()
        confirmSignOutButton.tap()
    }

    func testCreateAccountWithEmailAndPassword() {
        let continueWithEmailButtonUAT = app.buttons["Continue with Email UAT"] // Replace with correct identifier
        let continueWithEmailButtonProd = app.buttons["Continue with Email Prod"] // Replace with correct identifier
        let emailField = app.textFields["Email"]
        let continueButton = app.buttons["Continue"]
        let passwordField = app.secureTextFields["Password"]
        let nameField = app.textFields["Full Name"]
        let createAccountButton = app.buttons["Create Account"]
        
        if continueWithEmailButtonUAT.waitForExistence(timeout: 5) {
            continueWithEmailButtonUAT.tap()
        } else {
            continueWithEmailButtonProd.tap()
        }
        
        let timestamp = String(Int(Date().timeIntervalSince1970))
        let newEmail = "qa+\(timestamp)@plunge.com"
        
        emailField.tap()
        emailField.typeText(newEmail)
        continueButton.tap()
        
        passwordField.tap()
        passwordField.typeText("password123")
        continueButton.tap()
        
        nameField.tap()
        nameField.typeText("Test User")
        createAccountButton.tap()
        
        app.swipeUp()
        XCTAssert(app.staticTexts["Start a session"].exists, "Account creation failed.")
    }
}
