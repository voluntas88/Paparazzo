import Marshroute
import UIKit

public protocol SelfieCropperMarshrouteAssembly: class {
    func module(
        data: SelfieCropperData,
        routerSeed: RouterSeed,
        configure: (SelfieCropperModule) -> ())
        -> UIViewController
}

public protocol SelfieCropperMarshrouteAssemblyFactory: class {
    func circleImageCroppingMarshrouteAssembly() -> SelfieCropperAssembly
}
