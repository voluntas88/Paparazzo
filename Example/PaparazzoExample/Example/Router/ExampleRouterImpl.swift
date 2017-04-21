import UIKit
import Marshroute
import Paparazzo

final class ExampleRouterImpl: BaseRouter, ExampleRouter {
    
    private let mediaPickerAssemblyFactory = Paparazzo.MarshrouteAssemblyFactory(
        theme: PaparazzoUITheme.appSpecificTheme()
    )
    
    // MARK: - ExampleRouter
    
    func showMediaPicker(
        data: MediaPickerData,
        configure: (MediaPickerModule) -> ()
    ) {
        pushViewControllerDerivedFrom { routerSeed in
            
            let assembly = mediaPickerAssemblyFactory.mediaPickerAssembly()
            
            return assembly.module(
                data: data,
                routerSeed: routerSeed,
                configure: configure
            )
        }
    }
    
    func showPhotoLibrary(
        selectedItems: [PhotoLibraryItem],
        maxSelectedItemsCount: Int?,
        configure: (PhotoLibraryModule) -> ()
    ) {
        presentModalNavigationControllerWithRootViewControllerDerivedFrom { routerSeed in
            
            let assembly = mediaPickerAssemblyFactory.photoLibraryAssembly()
            
            return assembly.module(
                selectedItems: selectedItems,
                maxSelectedItemsCount: maxSelectedItemsCount,
                routerSeed: routerSeed,
                configure: configure
            )
        }
    }
}
