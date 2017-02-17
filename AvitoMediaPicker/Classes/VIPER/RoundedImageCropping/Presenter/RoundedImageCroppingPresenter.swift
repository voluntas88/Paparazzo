import Foundation
import ImageSource

final class RoundedImageCroppingPresenter: RoundedImageCroppingModule {
    
    private let interactor: RoundedImageCroppingInteractor
    private let router: RoundedImageCroppingRouter
    weak var view: RoundedImageCroppingViewInput?
    
    var onDiscard: (() -> ())?
    var onConfirm: ((ImageSource) -> ())?
    
    init(interactor: RoundedImageCroppingInteractor, router: RoundedImageCroppingRouter) {
        self.interactor = interactor
        self.router = router
    }
    
}
