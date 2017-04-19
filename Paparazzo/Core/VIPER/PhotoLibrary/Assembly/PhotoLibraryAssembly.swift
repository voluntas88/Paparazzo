import UIKit

public protocol PhotoLibraryAssembly: class {
    func module(
        seed: PhotoLibrarySeed,
        configure: (PhotoLibraryModule) -> ()
    ) -> UIViewController
}

public protocol PhotoLibraryAssemblyFactory: class {
    func photoLibraryAssembly() -> PhotoLibraryAssembly
}
