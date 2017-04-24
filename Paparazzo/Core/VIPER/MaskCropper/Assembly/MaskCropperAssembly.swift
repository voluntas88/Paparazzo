import ImageSource
import UIKit

public protocol MaskCropperAssembly: class {
    func module(
        data: MaskCropperData,
        configure: (MaskCropperModule) -> ())
        -> UIViewController
}

public protocol MaskCropperAssemblyFactory: class {
    func circleImageCroppingAssembly() -> MaskCropperAssembly
}
