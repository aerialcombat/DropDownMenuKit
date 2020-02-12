import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DropDownMenuKit_masterTests.allTests),
    ]
}
#endif
