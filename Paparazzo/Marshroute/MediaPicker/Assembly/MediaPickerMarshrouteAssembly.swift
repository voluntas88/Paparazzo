import Marshroute
import UIKit

public protocol MediaPickerMarshrouteAssembly: class {
    func module(
        seed: MediaPickerSeed,
        routerSeed: RouterSeed,
        configure: (MediaPickerModule) -> ())
        -> UIViewController
}

public protocol MediaPickerMarshrouteAssemblyFactory: class {
    func mediaPickerAssembly() -> MediaPickerMarshrouteAssembly
}
