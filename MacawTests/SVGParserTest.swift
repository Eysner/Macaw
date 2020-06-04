//
//  SVGParserTest.swift
//  MacawTests
//
//  Created by Julius Lundang on 19/08/2018.
//  Copyright © 2018 Exyte. All rights reserved.
//

import XCTest

#if os(OSX)
@testable import MacawOSX
#elseif os(iOS)
@testable import Macaw
#endif

class SVGParserTest: XCTestCase {
    func testParseFromOtherBundle() {
        let bundle = Bundle(for: type(of: TestUtils()))
        let bundleMacawTestsURL = bundle.resourceURL?.appendingPathComponent("MacawTests.bundle")
        let macawTestsBundle = Bundle(url: bundleMacawTestsURL!)!
        do {
            let node = try SVGParser.parse(resource: "circle", fromBundle: macawTestsBundle)
            XCTAssertNotNil(node)
            if let fullPath = macawTestsBundle.path(forResource: "circle", ofType: "svg") {
                let node2 = try SVGParser.parse(fullPath: fullPath)
                XCTAssertNotNil(node2)
            } else {
                XCTFail("No circle.svg found")
            }
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testParseGivenInvalidPath() {
        let fullPath = "invalid fullPath"
        XCTAssertThrowsError(try SVGParser.parse(fullPath: fullPath)) { error in
            XCTAssertEqual(error as! SVGParserError, SVGParserError.noSuchFile(path: "invalid fullPath"))
        }
    }
    
    func testParseGiventEmptyPath() {
        XCTAssertThrowsError(try SVGParser.parse(fullPath: "")) { error in
            XCTAssertEqual(error as! SVGParserError, SVGParserError.noSuchFile(path: ""))
        }
    }

    func testParseTspans() throws {
		// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/tspan
		let text = """
			<svg viewBox="0 0 240 40" xmlns="http://www.w3.org/2000/svg">
			  <style>
				text  { font: italic 12px serif; }
				tspan { font: bold 10px sans-serif; fill: red; }
			  </style>

			  <text x="10" y="30" class="small">
				You are
				<tspan>not</tspan>
				a banana!
			  </text>
			</svg>
		"""

		_ = try SVGParser.parse(text: text)
	}
}
