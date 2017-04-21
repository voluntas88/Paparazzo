import ImageSource

final class CircleImageCroppingPresenter: CircleImageCroppingModule {
    
    private let interactor: CircleImageCroppingInteractor
    private let router: CircleImageCroppingRouter
    
    weak var view: CircleImageCroppingViewInput? {
        didSet {
            setUpView()
        }
    }
    
    init(interactor: CircleImageCroppingInteractor, router: CircleImageCroppingRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func setUpView() {
        
        view?.setConfirmButtonTitle("Готово")
        
        view?.onDiscardTap = { [weak self] in
            self?.onDiscard?()
        }
        
        view?.onCloseTap = { [weak self] in
            self?.onClose?()
        }
        
        view?.onConfirmTap = { [weak self] previewImage in
            if let previewImage = previewImage {
                self?.interactor.croppedImage(previewImage: previewImage) { image in
                    self?.onConfirm?(image)
                }
            } else {
                self?.onDiscard?()
            }
        }
        
        interactor.canvasSize { [weak self] canvasSize in
            self?.view?.setCanvasSize(canvasSize)
        }
        
        interactor.imageWithParameters { [weak self] originalImage, previewImage, croppingParameters in
            self?.view?.setImage(originalImage, previewImage: previewImage) {
                self?.view?.setControlsEnabled(true)
                
                if let croppingParameters = croppingParameters {
                    self?.view?.setCroppingParameters(croppingParameters)
                }
            }
        }
    }
    
    var onDiscard: (() -> ())?
    var onClose: (() -> ())?
    var onConfirm: ((ImageSource) -> ())?
    
    func dismissModule() {
        router.dismissCurrentModule()
    }
    
}
