import Foundation

class SVGParserRegexHelper {

    fileprivate static let maskIdenitifierPattern = "url\\(#((?s:.*))\\)"
    fileprivate static var maskIdenitifierMatcher: NSRegularExpression?

    class func getMaskIdenitifierMatcher() -> NSRegularExpression? {
        if self.maskIdenitifierMatcher == nil {
            do {
                self.maskIdenitifierMatcher = try NSRegularExpression(pattern: maskIdenitifierPattern, options: .caseInsensitive)
            } catch {

            }
        }
        return self.maskIdenitifierMatcher
    }
}
