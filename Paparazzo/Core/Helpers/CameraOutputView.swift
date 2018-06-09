import AVFoundation
import UIKit

public final class CameraOutputView: UIView {
    
    // MARK: - Subview
    private let glkView: CameraOutputGLKView?
    
    // MARK: - Init
    
    public init(captureSession: AVCaptureSession, outputOrientation: ExifOrientation) {
        
        let eaglContext: EAGLContext? = EAGLContext(api: .openGLES2)
        
        glkView = eaglContext.flatMap { eaglContext in
            CameraOutputGLKView(
                captureSession: captureSession,
                outputOrientation: outputOrientation,
                eaglContext: eaglContext
            )
        }
        
        self.orientation = outputOrientation
        
        super.init(frame: .zero)
        
        if let glkView = glkView {
            addSubview(glkView)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIView
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        glkView?.frame = bounds
    }
    
    // MARK: - CameraOutputView
    
    public var orientation: ExifOrientation {
        didSet {
            glkView?.orientation = orientation
        }
    }
    
    public var onFrameDraw: (() -> ())? {
        didSet {
            glkView?.onFrameDraw = onFrameDraw
        }
    }
}
