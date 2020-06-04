import Foundation

class SVGParserRegexHelper {

    fileprivate static let textElementPattern = "<text.*?>((?s:.*))<\\/text>"
    fileprivate static let maskIdenitifierPattern = "url\\(#((?s:.*))\\)"

    fileprivate static var textElementMatcher: NSRegularExpression?
    fileprivate static var maskIdenitifierMatcher: NSRegularExpression?
    fileprivate static var unitsMatcher: NSRegularExpression?

    class func getTextElementMatcher() -> NSRegularExpression? {
        if self.textElementMatcher == nil {
            do {
                self.textElementMatcher = try NSRegularExpression(pattern: textElementPattern, options: .caseInsensitive)
            } catch {

            }
        }
        return self.textElementMatcher
    }

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
