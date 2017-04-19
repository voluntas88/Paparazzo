import ImageSource

final class CircleImageCroppingPresenter: CircleImageCroppingModule {
    
    private let interactor: CircleImageCroppingInteractor
    
    weak var view: CircleImageCroppingViewInput? {
        didSet {
            setUpView()
        }
    }
    
    init(interactor: CircleImageCroppingInteractor) {
        self.interactor = interactor
    }
    
    func setUpView() {
        
    }
    
    var onDiscard: (() -> ())?
    
    var onConfirm: ((ImageSource) -> ())?
    
}
