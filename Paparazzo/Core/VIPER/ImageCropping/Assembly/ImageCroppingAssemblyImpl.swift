import ImageSource
import UIKit

public final class ImageCroppingAssemblyImpl: BasePaparazzoAssembly, ImageCroppingAssembly {
    
    public func module(
        image: ImageSource,
        canvasSize: CGSize,
        configure: (ImageCroppingModule) -> ()
    ) -> UIViewController {

        let interactor = ImageCroppingInteractorImpl(image: image, canvasSize: canvasSize)

        let presenter = ImageCroppingPresenter(
            interactor: interactor
        )

        let viewController = ImageCroppingViewController()
        viewController.addDisposable(presenter)
        viewController.setTheme(theme)

        presenter.view = viewController
        
        configure(presenter)

        return viewController
    }
}
