import UIKit
import ImageSource
import Marshroute

public protocol RoundedImageCroppingAssembly: class {
    
    func module(
        item: MediaPickerItem,
        routerSeed: RouterSeed,
        configuration: (RoundedImageCroppingModule) -> ()
        ) -> UIViewController
}

protocol RoundedImageCroppingAssemblyFactory: class {
    func roundedImageCroppingAssembly() -> RoundedImageCroppingAssembly
}
