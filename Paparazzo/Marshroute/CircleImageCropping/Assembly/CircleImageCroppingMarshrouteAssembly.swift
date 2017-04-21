import Marshroute
import UIKit

public protocol CircleImageCroppingMarshrouteAssembly: class {
    func module(
        data: MediaPickerData,
        routerSeed: RouterSeed,
        configure: (CircleImageCroppingModule) -> ())
        -> UIViewController
}

public protocol CircleImageCroppingMarshrouteAssemblyFactory: class {
    func circleImageCroppingMarshrouteAssembly() -> CircleImageCroppingAssembly
}
