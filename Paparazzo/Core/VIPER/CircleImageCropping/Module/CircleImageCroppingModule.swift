import ImageSource

public protocol CircleImageCroppingModule: class {
    var onDiscard: (() -> ())? { get set }
    var onConfirm: ((ImageSource) -> ())? { get set }
}
