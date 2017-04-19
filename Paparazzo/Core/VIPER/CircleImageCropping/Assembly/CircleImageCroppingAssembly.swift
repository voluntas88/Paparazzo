import ImageSource
import UIKit

protocol CircleImageCroppingAssembly: class {
    func module(
        image: ImageSource,
        canvasSize: CGSize,
        configure: (CircleImageCroppingModule) -> ())
        -> UIViewController
}

protocol CircleImageCroppingAssemblyFactory: class {
    func imageCroppingAssembly() -> CircleImageCroppingAssembly
}
