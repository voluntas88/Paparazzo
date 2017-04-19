import UIKit

public protocol MediaPickerAssembly: class {
    func module(
        seed: MediaPickerSeed,
        configure: (MediaPickerModule) -> ())
        -> UIViewController
}

public protocol MediaPickerAssemblyFactory: class {
    func mediaPickerAssembly() -> MediaPickerAssembly
}
