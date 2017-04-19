import UIKit

public final class PhotoLibraryAssemblyImpl: PhotoLibraryAssembly {
    
    private let theme: PhotoLibraryUITheme
    
    init(theme: PhotoLibraryUITheme) {
        self.theme = theme
    }
    
    public func module(
        seed: PhotoLibrarySeed,
        configure: (PhotoLibraryModule) -> ())
        -> UIViewController
    {
        let photoLibraryItemsService = PhotoLibraryItemsServiceImpl()
        
        let interactor = PhotoLibraryInteractorImpl(
            selectedItems: seed.selectedItems,
            maxSelectedItemsCount: seed.maxSelectedItemsCount,
            photoLibraryItemsService: photoLibraryItemsService
        )
        
        let viewController = PhotoLibraryViewController()
        
        let router = PhotoLibraryUIKitRouter(viewController: viewController)
        
        let presenter = PhotoLibraryPresenter(
            interactor: interactor,
            router: router
        )
        
        viewController.addDisposable(presenter)
        viewController.setTheme(theme)
        
        presenter.view = viewController
        
        configure(presenter)
        
        return viewController
    }
}
