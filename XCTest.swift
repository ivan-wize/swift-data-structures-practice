// XCTest & XCUITest Cheat Sheet

import XCTest

// MARK: - XCTest: Writing Unit Tests

class MyUnitTests: XCTestCase {

    // Called before each test method in the class
    // Use this to set up any required state or initialize objects needed for the tests
    override func setUp() {
        super.setUp()
        // Example: Resetting shared resources or test-specific configurations
    }

    // Called after each test method in the class
    // Use this to clean up or reset any state changes made during the tests
    override func tearDown() {
        // Example: Removing temporary files or resetting mock data
        super.tearDown()
    }

    // Example test method
    // Test the addition of two integers and verify the result is correct
    func testAddition() {
        let sum = 2 + 2
        XCTAssertEqual(sum, 4, "Sum should be 4") // Assert equality to check the result
    }

    // Performance test example
    // Measure the time taken to execute a block of code
    func testPerformanceExample() {
        self.measure {
            // Example: Sorting a large array to measure its performance
            _ = Array(0...1_000_000).sorted()
        }
    }
}

// MARK: - XCUITest: Writing UI Tests

import XCTest

class MyUITests: XCTestCase {

    // Instance of the application under test
    let app = XCUIApplication()

    // Called before each test method in the class
    // Used to launch the app and set the initial state
    override func setUp() {
        super.setUp()
        
        // Launch the app before starting tests
        app.launch()
        
        // Stop immediately when a failure occurs
        // Helps in debugging test failures one by one
        continueAfterFailure = false
    }

    // Called after each test method in the class
    // Used for additional cleanup if needed
    override func tearDown() {
        // Example: Closing mock servers or clearing app data
        super.tearDown()
    }

    // Example UI test method for a login flow
    // Simulate user input and interaction with login fields and button
    func testLoginFlow() {
        // Locate elements using accessibility identifiers (set in your app code)
        let usernameField = app.textFields["username"]
        let passwordField = app.secureTextFields["password"]
        let loginButton = app.buttons["login"]

        // Interact with the elements
        usernameField.tap() // Focus the username field
        usernameField.typeText("testuser") // Enter the username

        passwordField.tap() // Focus the password field
        passwordField.typeText("password123") // Enter the password

        loginButton.tap() // Tap the login button

        // Assert expected outcomes
        // Verify if the welcome label exists after login
        let welcomeLabel = app.staticTexts["welcome"]
        XCTAssertTrue(welcomeLabel.exists, "Login was unsuccessful")
    }

    // Example test for navigating to another screen
    // Verify if tapping a button transitions to the Settings screen
    func testNavigateToSettings() {
        let settingsButton = app.buttons["settings"]
        settingsButton.tap() // Simulate tapping the Settings button

        let settingsScreenTitle = app.staticTexts["Settings"]
        XCTAssertTrue(settingsScreenTitle.exists, "Failed to navigate to Settings screen")
    }
}

// MARK: - Common XCUITest Actions

// Tapping an element
// Simulates a user tap on the specified element
// element.tap()

// Typing text into a text field
// Simulates typing a string into a text field
// element.typeText("Some Text")

// Asserting an element exists
// Checks if a UI element is present in the view hierarchy
// XCTAssertTrue(element.exists)

// Swiping gestures
// Simulates swiping in different directions on an element
// element.swipeUp()
// element.swipeDown()
// element.swipeLeft()
// element.swipeRight()

// Scrolling
// Example: Simulates a swipe to scroll within a scroll view
// app.scrollViews.firstMatch.swipeUp()

// Waiting for an element to appear (timeout: seconds)
// Waits for an element to exist within a given time
// let exists = element.waitForExistence(timeout: 5)
// XCTAssertTrue(exists, "Element did not appear in time")

// Launching the app with arguments and environment variables
// Example: Pass specific launch arguments and environment variables for testing
// app.launchArguments = ["-UITest"]
// app.launchEnvironment = ["isLoggedIn": "true"]
// app.launch()

// Taking a screenshot
// Captures a screenshot of the current app state
// let screenshot = app.screenshot()
// let attachment = XCTAttachment(screenshot: screenshot)
// attachment.name = "Screenshot Name"
// attachment.lifetime = .keepAlways // Keep attachment for later reference
// add(attachment)

// MARK: - Tips
// 1. Use Accessibility Identifiers for elements in your app to make them testable.
//    Example: Assign unique identifiers to UI elements in your app code.
// 2. Structure your UI tests to be reusable and modular.
//    Example: Create helper functions for repeated interactions like login or navigation.
// 3. Use launchArguments and launchEnvironment to simulate different app states.
//    Example: Test logged-in and logged-out states by passing arguments.
// 4. Always test on both simulator and real devices.
//    Example: Test on various screen sizes and iOS versions for better coverage.
// 5. Keep tests isolated and independent.
//    Example: Avoid relying on the outcome of other tests to prevent cascading failures.

// Happy Testing with XCTest & XCUITest!
