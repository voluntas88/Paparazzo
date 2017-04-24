import Marshroute
import UIKit

public final class MaskCropperMarshrouteAssemblyImpl: BasePaparazzoAssembly, MaskCropperMarshrouteAssembly {
    
    public func module(
        data: MaskCropperData,
        routerSeed: RouterSeed,
        configure: (MaskCropperModule) -> ()
        ) -> UIViewController {
        
        let interactor = MaskCropperInteractorImpl(
            image: data.photo.image,
            canvasSize: data.cropCanvasSize
        )
        
        let router = MaskCropperMarshrouteRouter(
            routerSeed: routerSeed
        )
        
        let presenter = MaskCropperPresenter(
            interactor: interactor,
            router: router
        )
        
        let viewController = MaskCropperViewController()
        viewController.addDisposable(presenter)
        viewController.setTheme(theme)
        
        presenter.view = viewController
        
        configure(presenter)
        
        return viewController
    }
}
