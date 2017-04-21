import Marshroute
import UIKit

public protocol CircleImageCroppingMarshrouteAssembly: class {
    func module(
        data: CircleImageCroppingData,
        routerSeed: RouterSeed,
        configure: (CircleImageCroppingModule) -> ())
        -> UIViewController
}

public protocol CircleImageCroppingMarshrouteAssemblyFactory: class {
    func circleImageCroppingMarshrouteAssembly() -> CircleImageCroppingAssembly
}
