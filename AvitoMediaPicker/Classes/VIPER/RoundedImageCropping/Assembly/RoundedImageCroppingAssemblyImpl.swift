import UIKit
import ImageSource
import Marshroute

public final class RoundedImageCroppingAssemblyImpl: RoundedImageCroppingAssembly {
    
    public func module(
        item: MediaPickerItem,
        routerSeed: RouterSeed,
        configuration: (RoundedImageCroppingModule) -> ()
        ) -> UIViewController
    {
        let interactor = RoundedImageCroppingInteractorImpl()
        
        let router = RoundedImageCroppingRouterImpl(routerSeed: routerSeed)
        
        let presenter = RoundedImageCroppingPresenter(
            interactor: interactor,
            router: router
        )
        
        let viewController = RoundedImageCroppingViewController()
        viewController.addDisposable(presenter)
        
        presenter.view = viewController
        
        configuration(presenter)
        
        return viewController
        
    }
}

