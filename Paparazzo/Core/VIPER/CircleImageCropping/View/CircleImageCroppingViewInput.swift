import ImageSource

protocol CircleImageCroppingViewInput: class {
    func setTitle(_: String)
    
    func setImage(_: ImageSource, previewImage: ImageSource?, completion: @escaping () -> ())
    func setCroppingParameters(_: ImageCroppingParameters)
    func setCanvasSize(_: CGSize)
    func setControlsEnabled(_: Bool)
    
    var onCloseButtonTap: (() -> ())? { get set }
    var onConfirmButtonTap: ((_ previewImage: CGImage?) -> ())? { get set }
    var onRetakePhotoButtonTap: (() -> ())? { get set }

    var onCroppingParametersChange: ((ImageCroppingParameters) -> ())? { get set }
}
