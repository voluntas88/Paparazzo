public protocol CroppingOverlayProvider {
    func croppingOverlayView() -> UIView
}

public struct MaskCropperData {
    
    public let photo: MediaPickerItem
    public let cropCanvasSize: CGSize
    public var overlayProvider: CroppingOverlayProvider?
    
    public init(
        photo: MediaPickerItem,
        cropCanvasSize: CGSize,
        overlayProvider: CroppingOverlayProvider? = nil)
    {
        self.photo = photo
        self.cropCanvasSize = cropCanvasSize
        self.overlayProvider = overlayProvider
    }
    
}

