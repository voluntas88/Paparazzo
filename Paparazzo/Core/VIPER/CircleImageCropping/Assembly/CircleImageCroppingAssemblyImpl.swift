import ImageSource
import UIKit

public final class CircleImageCroppingAssemblyImpl: CircleImageCroppingAssembly {
    
    private let theme: CircleImageCroppingUITheme
    
    init(theme: CircleImageCroppingUITheme) {
        self.theme = theme
    }
    
    public func module(
        seed: CircleImageCroppingSeed,
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
