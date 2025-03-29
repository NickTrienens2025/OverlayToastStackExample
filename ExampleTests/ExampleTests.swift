//
//  ExampleTests.swift
//  ExampleTests
//
//  Created by Nick Trienens on 3/18/25.
//

import Testing
import XCTest
@testable import Example

import SnapshottingTests
import Snapshotting


class DemoAppPreviewTest: SnapshotTest {
    
    // Return the type names of previews like "MyApp.MyView._Previews" to selectively render only some previews
    override class func snapshotPreviews() -> [String]? {
        return nil
    }
    
    // Use this to exclude some previews from generating
    override class func excludedSnapshotPreviews() -> [String]? {
        return nil
    }
}
class DemoAppAccessibilityPreviewTest: AccessibilityPreviewTest {
    
    override func auditType() -> XCUIAccessibilityAuditType {
        return .all
    }
    
    override func handle(issue: XCUIAccessibilityAuditIssue) -> Bool {
        return false
    }
}

struct ExampleTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }

}
