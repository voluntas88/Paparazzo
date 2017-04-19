import ImageSource
import UIKit

public protocol CircleImageCroppingAssembly: class {
    func module(
        seed: CircleImageCroppingSeed,
        configure: (CircleImageCroppingModule) -> ())
        -> UIViewController
}

public protocol CircleImageCroppingAssemblyFactory: class {
    func circleImageCroppingAssembly() -> CircleImageCroppingAssembly
}
