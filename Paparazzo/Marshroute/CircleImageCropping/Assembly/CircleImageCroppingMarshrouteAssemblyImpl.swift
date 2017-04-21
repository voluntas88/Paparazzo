import Marshroute
import UIKit

public final class CircleImageCroppingMarshrouteAssemblyImpl: BasePaparazzoAssembly, CircleImageCroppingMarshrouteAssembly {
    
    public func module(
        data: MediaPickerData,
        routerSeed: RouterSeed,
        configure: (CircleImageCroppingModule) -> ()
        ) -> UIViewController {
        
        let interactor = CircleImageCroppingInteractorImpl()
        
        let presenter = CircleImageCroppingPresenter(
            interactor: interactor
        )
        
        let viewController = CircleImageCroppingViewController()
        viewController.addDisposable(presenter)
        viewController.setTheme(theme)
        
        presenter.view = viewController
        
        configure(presenter)
        
        return viewController
    }
}
