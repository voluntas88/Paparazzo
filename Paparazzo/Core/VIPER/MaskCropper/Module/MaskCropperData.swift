public enum OverlayType {
    case circle
    case rectangle(cornerRadius: CGFloat, margin: CGFloat)
    case heartShape
    case custom(CroppingOverlayProvider)
}

public struct MaskCropperData {
    
    public let photo: MediaPickerItem
    public let cropCanvasSize: CGSize
    public var overlayType: OverlayType
    
    public init(
        photo: MediaPickerItem,
        cropCanvasSize: CGSize,
        overlayType: OverlayType = .circle)
    {
        self.photo = photo
        self.cropCanvasSize = cropCanvasSize
        self.overlayType = overlayType
    }
    
}

