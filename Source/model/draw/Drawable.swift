import Foundation

open class Drawable: NSObject {

    public let visible: Bool
    public var tag: [String]

    public init(visible: Bool = true, tag: [String] = []) {
        self.visible = visible
        self.tag = tag
    }
}
