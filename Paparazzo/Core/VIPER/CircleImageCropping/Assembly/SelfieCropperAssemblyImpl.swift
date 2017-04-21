import ImageSource
import UIKit

public final class SelfieCropperAssemblyImpl: BasePaparazzoAssembly, SelfieCropperAssembly {
    
    public func module(
        data: SelfieCropperData,
        configure: (SelfieCropperModule) -> ()
        ) -> UIViewController {
        
        let interactor = SelfieCropperInteractorImpl(
            image: data.photo.image,
            canvasSize: data.cropCanvasSize
        )
        
        let viewController = SelfieCropperViewController()
        
        let router = CircleImageCropperUIKitRouter(
            viewController: viewController
        )
        
        let presenter = SelfieCropperPresenter(
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
