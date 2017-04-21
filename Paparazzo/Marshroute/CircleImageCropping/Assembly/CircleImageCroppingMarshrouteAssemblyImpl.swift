import Marshroute
import UIKit

public final class CircleImageCroppingMarshrouteAssemblyImpl: BasePaparazzoAssembly, CircleImageCroppingMarshrouteAssembly {
    
    public func module(
        data: CircleImageCroppingData,
        routerSeed: RouterSeed,
        configure: (CircleImageCroppingModule) -> ()
        ) -> UIViewController {
        
        let interactor = CircleImageCroppingInteractorImpl(
            image: data.photo.image,
            canvasSize: data.cropCanvasSize
        )
        
        let router = CircleImageCroppingMarshrouteRouter(
            routerSeed: routerSeed
        )
        
        let presenter = CircleImageCroppingPresenter(
            interactor: interactor,
            router: router
        )
        
        let viewController = CircleImageCroppingViewController()
        viewController.addDisposable(presenter)
        viewController.setTheme(theme)
        
        presenter.view = viewController
        
        configure(presenter)
        
        return viewController
    }
}
