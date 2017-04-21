import Marshroute
import UIKit

public final class SelfieCropperMarshrouteAssemblyImpl: BasePaparazzoAssembly, SelfieCropperMarshrouteAssembly {
    
    public func module(
        data: SelfieCropperData,
        routerSeed: RouterSeed,
        configure: (SelfieCropperModule) -> ()
        ) -> UIViewController {
        
        let interactor = SelfieCropperInteractorImpl(
            image: data.photo.image,
            canvasSize: data.cropCanvasSize
        )
        
        let router = SelfieCropperMarshrouteRouter(
            routerSeed: routerSeed
        )
        
        let presenter = SelfieCropperPresenter(
            interactor: interactor,
            router: router
        )
        
        let viewController = SelfieCropperViewController()
        viewController.addDisposable(presenter)
        viewController.setTheme(theme)
        
        presenter.view = viewController
        
        configure(presenter)
        
        return viewController
    }
}
