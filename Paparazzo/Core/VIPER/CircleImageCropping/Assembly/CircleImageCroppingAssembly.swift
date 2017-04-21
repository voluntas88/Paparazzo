import ImageSource
import UIKit

public protocol CircleImageCroppingAssembly: class {
    func module(
        data: MediaPickerData,
        configure: (CircleImageCroppingModule) -> ())
        -> UIViewController
}

public protocol CircleImageCroppingAssemblyFactory: class {
    func circleImageCroppingAssembly() -> CircleImageCroppingAssembly
}
