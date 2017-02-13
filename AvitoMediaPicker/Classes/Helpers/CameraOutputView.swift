import AVFoundation
import GLKit
import ImageSource

final class CameraOutputView: GLKView {
    
    // MARK: - Init
    
    init(captureSession: AVCaptureSession, outputOrientation: ExifOrientation) {
        
        let eaglContext: EAGLContext = EAGLContext(api: .openGLES2)
        
        ciContext = CIContext(eaglContext: eaglContext, options: [kCIContextWorkingColorSpace: NSNull()])
        orientation = outputOrientation
        
        super.init(frame: .zero, context: eaglContext)
        
        clipsToBounds = true
        enableSetNeedsDisplay = false
        
        CaptureSessionPreviewService.startStreamingPreview(of: captureSession, to: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CameraOutputView
    
    var orientation: ExifOrientation
    var imageBuffer: CVImageBuffer?
    
    var onFrameDrawn: (() -> ())?
    
    // MARK: - GLKView
    
    override func draw(_ rect: CGRect) {
        guard let imageBuffer = imageBuffer else { return }
        
        let screenScale = UIScreen.main.scale
        
        var drawableBounds = rect
        drawableBounds.size.width *= screenScale
        drawableBounds.size.height *= screenScale
        
        let sourceImage = CIImage(cvPixelBuffer: imageBuffer).applyingOrientation(Int32(orientation.rawValue))
        let sourceExtent = sourceImage.extent
        
        let sourceAspect = sourceExtent.size.width / sourceExtent.size.height
        let previewAspect = rect.size.width  / rect.size.height
        
        // we want to maintain the aspect radio of the screen size, so we clip the video image
        var drawRect = sourceExtent
        
        if sourceAspect > previewAspect {
            // use full height of the video image, and center crop the width
            drawRect.origin.x += (drawRect.size.width - drawRect.size.height * previewAspect) / 2
            drawRect.size.width = drawRect.size.height * previewAspect
        } else {
            // use full width of the video image, and center crop the height
            drawRect.origin.y += (drawRect.size.height - drawRect.size.width / previewAspect) / 2
            drawRect.size.height = drawRect.size.width / previewAspect
        }
        
        ciContext.draw(sourceImage, in: drawableBounds, from: drawRect)
        
        onFrameDrawn?()
    }
    
    // MARK: - Private
    
    private let ciContext: CIContext
}
