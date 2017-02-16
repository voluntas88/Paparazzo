import UIKit
import ImageSource
import Marshroute

protocol RoundedImageCroppingAssembly: class {
    
    func viewController(
        image: ImageSource,
        canvasSize: CGSize,
        routerSeed: RouterSeed,
        configuration: (ImageCroppingModule) -> ()
        ) -> UIViewController
}

protocol RoundedImageCroppingAssemblyFactory: class {
    func roundedImageCroppingAssembly() -> RoundedImageCroppingAssembly
}
