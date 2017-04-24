import Marshroute
import UIKit

public final class MaskCropperMarshrouteAssemblyImpl: BasePaparazzoAssembly, MaskCropperMarshrouteAssembly {
    
    public func module(
        data: MaskCropperData,
        routerSeed: RouterSeed,
        configure: (MaskCropperModule) -> ()
        ) -> UIViewController {
        
        let imageCroppingService = serviceFactory.imageCroppingService(
            image: data.photo.image,
            canvasSize: data.cropCanvasSize
        )
        
        let interactor = MaskCropperInteractorImpl(
            imageCroppingService: imageCroppingService
        )
        
        let router = MaskCropperMarshrouteRouter(
            routerSeed: routerSeed
        )
        
        let presenter = MaskCropperPresenter(
            interactor: interactor,
            router: router
        )
        
        let viewController = MaskCropperViewController(
            croppingOverlayProvider: croppingOverlayProvider(overlayType: data.overlayType)
        )
        viewController.addDisposable(presenter)
        viewController.setTheme(theme)
        
        presenter.view = viewController
        
        configure(presenter)
        
        return viewController
    }
    
    private func croppingOverlayProvider(overlayType: OverlayType) -> CroppingOverlayProvider {
        switch overlayType {
        case .circle:
            return serviceFactory.circleCroppingOverlayProvider()
        case .rectangle(let cornerRadius, let margin):
            return serviceFactory.rectangleCroppingOverlayProvider(cornerRadius: cornerRadius, margin: margin)
        case .heartShape:
            return serviceFactory.heartShapeCroppingOverlayProvider()
        case .custom(let provider):
            return provider
        }
    }
}
