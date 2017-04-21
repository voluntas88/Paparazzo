import ImageSource

protocol SelfieCropperInteractor {
    func canvasSize(completion: @escaping (CGSize) -> ())
    
    func imageWithParameters(completion: @escaping (_ original: ImageSource, _ preview: ImageSource?, _ parameters: ImageCroppingParameters?) -> ())
    func croppedImage(previewImage: CGImage, completion: @escaping (CroppedImageSource) -> ())
}
