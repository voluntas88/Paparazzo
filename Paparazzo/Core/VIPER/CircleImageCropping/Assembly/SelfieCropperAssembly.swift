import ImageSource
import UIKit

public protocol SelfieCropperAssembly: class {
    func module(
        data: SelfieCropperData,
        configure: (SelfieCropperModule) -> ())
        -> UIViewController
}

public protocol SelfieCropperAssemblyFactory: class {
    func circleImageCroppingAssembly() -> SelfieCropperAssembly
}
