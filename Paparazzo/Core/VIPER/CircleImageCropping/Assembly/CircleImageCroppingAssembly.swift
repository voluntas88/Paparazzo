import ImageSource
import UIKit

public protocol CircleImageCroppingAssembly: class {
    func module(
        data: CircleImageCroppingData,
        configure: (CircleImageCroppingModule) -> ())
        -> UIViewController
}

public protocol CircleImageCroppingAssemblyFactory: class {
    func circleImageCroppingAssembly() -> CircleImageCroppingAssembly
}
