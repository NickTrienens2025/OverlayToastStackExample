//
//  ExampleUITests.swift
//  ExampleUITests
//
//  Created by Nick Trienens on 3/18/25.
//

import XCTest

final class ExampleUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it's important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        XCUIDevice.shared.orientation = .portrait
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    override static func tearDown() {
        print("what", Snapshot.cacheDirectory?.absoluteString ?? "", Snapshot.screenshotsDirectory?.absoluteString ?? "" )
        print("Simulator Runtime Version:", ProcessInfo.processInfo.simulatorRuntimeVersion )
    }

    func setOrientation(_ orientation: UIDeviceOrientation) {
        XCUIDevice.shared.orientation = orientation
    }

    @MainActor
    func testLightModeScreenshots() async throws {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launchArguments = ["--uitesting"]
        app.launch()
        
        // Wait for initial state
        try? await Task.sleep(for: .seconds(2))
        
        // Portrait
        setOrientation(.portrait)
        snapshot("testing-portrait")
        
        let screenshotPortrait = app.screenshot()
        let attachmentPortrait = XCTAttachment(screenshot: screenshotPortrait)
        attachmentPortrait.name = "Default Size - Portrait"
        attachmentPortrait.lifetime = .keepAlways
        add(attachmentPortrait)
        
    }
    
    @MainActor
    func testLightModeScreenshotsLandscape() async throws {

        // Light Mode
        let lightApp = XCUIApplication()
        setupSnapshot(lightApp)
        XCUIDevice.shared.appearance = .light
        lightApp.launchArguments = ["--uitesting"]
//        setOrientation(.landscapeLeft)
        lightApp.launch()
        
        // Wait for initial state
        try? await Task.sleep(for: .seconds(1))
        snapshot("testing-\(ProcessInfo.processInfo.simulatorRuntimeVersion)-landscape-light")
        
        lightApp.terminate()
        
        // Dark Mode
        let darkApp = XCUIApplication()
        setupSnapshot(darkApp)
        XCUIDevice.shared.appearance = .dark
        darkApp.launchArguments = ["--uitesting"]
//        setOrientation(.landscapeLeft)
        darkApp.launch()
        
        try? await Task.sleep(for: .seconds(1))
        snapshot("testing-\(ProcessInfo.processInfo.simulatorRuntimeVersion)-landscape-dark")
    }
    
    @MainActor
    func testDynamicTypeScreenshots() async throws {
        // Test with different dynamic type sizes
        let orientations: [(UIDeviceOrientation, String)] = [
            (.portrait, "Portrait"),
            (.landscapeLeft, "Landscape")
        ]

        let categories = [
            "UICTContentSizeCategoryXS",
            "UICTContentSizeCategoryS",
            "UICTContentSizeCategoryM",
            "UICTContentSizeCategoryL",
            "UICTContentSizeCategoryXL",
            "UICTContentSizeCategoryXXL",
            "UICTContentSizeCategoryXXXL",
            "UICTContentSizeCategoryAccessibilityM",
            "UICTContentSizeCategoryAccessibilityL",
            "UICTContentSizeCategoryAccessibilityXL",
            "UICTContentSizeCategoryAccessibilityXXL",
            "UICTContentSizeCategoryAccessibilityXXXL"
        ]
        
        for category in categories {
            for (orientation, orientationName) in orientations {
                let app = XCUIApplication()
                app.launchArguments = ["--uitesting", "-UIPreferredContentSizeCategoryName", category]
                setupSnapshot(app)

                app.launch()
                
                // Wait for initial state
                try? await Task.sleep(for: .seconds(2))
                
                setOrientation(orientation)
                try? await Task.sleep(for: .seconds(1))
                
                // Take screenshot
                let screenshot = app.screenshot()
                let attachment = XCTAttachment(screenshot: screenshot)
                attachment.name = "Dynamic Type - \(category) - \(orientationName)"
                attachment.lifetime = .keepAlways
                add(attachment)
                
                snapshot("Dynamic Type - \(category) - \(orientationName)")
            }
        }
    }

    @MainActor
    func testLandscapeScreenshots() async throws {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launchArguments = ["--uitesting"]
        app.launch()
        
        // Wait for initial state
        try? await Task.sleep(for: .seconds(2))
        
        // Test landscape left
        setOrientation(.landscapeLeft)
        try? await Task.sleep(for: .seconds(1))
        snapshot("landscape-left")
        
        let screenshotLeft = app.screenshot()
        let attachmentLeft = XCTAttachment(screenshot: screenshotLeft)
        attachmentLeft.name = "Landscape Left"
        attachmentLeft.lifetime = .keepAlways
        add(attachmentLeft)
        
        // Test landscape right
        setOrientation(.landscapeRight)
        try? await Task.sleep(for: .seconds(1))
        snapshot("landscape-right")
        
        let screenshotRight = app.screenshot()
        let attachmentRight = XCTAttachment(screenshot: screenshotRight)
        attachmentRight.name = "Landscape Right"
        attachmentRight.lifetime = .keepAlways
        add(attachmentRight)
    }

}

extension ProcessInfo {
    var simulatorRuntimeVersion: String {
        environment["SIMULATOR_RUNTIME_VERSION"] ?? "Unknown"
    }
}
