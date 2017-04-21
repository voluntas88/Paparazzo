import ImageSource
import UIKit

public final class CircleImageCroppingAssemblyImpl: BasePaparazzoAssembly, CircleImageCroppingAssembly {
    
    public func module(
        data: CircleImageCroppingData,
        configure: (CircleImageCroppingModule) -> ()
        ) -> UIViewController {
        
        let interactor = CircleImageCroppingInteractorImpl(
            image: data.photo.image,
            canvasSize: data.cropCanvasSize
        )
        
        let viewController = CircleImageCroppingViewController()
        
        let router = CircleImageCropperUIKitRouter(
            viewController: viewController
        )
        
        let presenter = CircleImageCroppingPresenter(
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
