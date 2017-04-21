import ImageSource
import UIKit

public final class CircleImageCroppingAssemblyImpl: BasePaparazzoAssembly, CircleImageCroppingAssembly {
    
    public func module(
        data: CircleImageCroppingData,
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
