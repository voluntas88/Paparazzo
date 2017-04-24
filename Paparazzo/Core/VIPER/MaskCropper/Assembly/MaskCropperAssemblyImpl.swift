import ImageSource
import UIKit

public final class MaskCropperAssemblyImpl: BasePaparazzoAssembly, MaskCropperAssembly {
    
    public func module(
        data: MaskCropperData,
        configure: (MaskCropperModule) -> ()
        ) -> UIViewController {
        
        let interactor = MaskCropperInteractorImpl(
            image: data.photo.image,
            canvasSize: data.cropCanvasSize
        )
        
        let viewController = MaskCropperViewController()
        
        let router = CircleImageCropperUIKitRouter(
            viewController: viewController
        )
        
        let presenter = MaskCropperPresenter(
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
