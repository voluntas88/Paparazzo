import ImageSource

public protocol CircleImageCroppingModule: class {
    
    func dismissModule()
    
    var onDiscard: (() -> ())? { get set }
    var onConfirm: ((ImageSource) -> ())? { get set }
}
