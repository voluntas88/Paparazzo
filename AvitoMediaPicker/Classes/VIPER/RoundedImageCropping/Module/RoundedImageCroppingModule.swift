import ImageSource

public protocol RoundedImageCroppingModule: class {
    var onDiscard: (() -> ())? { get set }
    var onConfirm: ((ImageSource) -> ())? { get set }
}
