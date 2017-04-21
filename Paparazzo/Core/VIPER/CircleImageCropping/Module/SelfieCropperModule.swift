import ImageSource

public protocol SelfieCropperModule: class {
    
    func dismissModule()
    
    var onClose: (() -> ())? { get set }
    var onDiscard: (() -> ())? { get set }
    var onConfirm: ((ImageSource) -> ())? { get set }
}
