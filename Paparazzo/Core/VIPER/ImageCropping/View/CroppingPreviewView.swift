import ImageSource
import UIKit

final class CroppingPreviewView: UIView {
    
    /// This view is shown to prevent blinking while image is loading
    private let splashView = UIImageView()
    
    /// Максимальный размер оригинальной картинки. Если меньше размера самой картинки, она будет даунскейлиться.
    private var sourceImageMaxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
    
    private let previewView = PhotoTweakView()
    
    // MARK: - Private
    
    private var aspectRatio: AspectRatio = .portrait_3x4
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        //backgroundColor = .white
        clipsToBounds = true
        
        splashView.contentMode = .scaleAspectFill
        
        addSubview(previewView)
        //addSubview(splashView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        previewView.frame = bounds
    }
    
    func layoutSplashViewIn(bounds: CGRect) {
        
        let height: CGFloat
        
        switch aspectRatio {
        case .portrait_3x4:
            height = bounds.size.width * 4 / 3
        case .landscape_4x3:
            height = bounds.size.width * 3 / 4
        }
        
        let scaleToFit = min(1, previewView.height / height)
        
        splashView.size = CGSize(width: bounds.size.width, height: height).scaled(scaleToFit)
        splashView.center = previewView.center
    }
    
    // MARK: - CroppingPreviewView
    
    var cropAspectRatio: CGFloat {
        get { return previewView.cropAspectRatio }
        set { previewView.cropAspectRatio = newValue }
    }
    
    var onCroppingParametersChange: ((ImageCroppingParameters) -> ())? {
        get { return previewView.onCroppingParametersChange }
        set { previewView.onCroppingParametersChange = newValue }
    }
    
    func setImage(_ image: ImageSource, previewImage: ImageSource?, completion: (() -> ())?) {
        
        if let previewImage = previewImage {
            
            let screenSize = UIScreen.main.bounds.size
            let previewOptions = ImageRequestOptions(size: .fitSize(screenSize), deliveryMode: .progressive)
            
            splashView.isHidden = false
            
            previewImage.requestImage(options: previewOptions) { [weak self] (result: ImageRequestResult<UIImage>) in
                if let image = result.image, self?.splashView.isHidden == false {
                    self?.splashView.image = image
                }
            }
        }
        
        let options = ImageRequestOptions(size: .fitSize(sourceImageMaxSize), deliveryMode: .best)
        
        image.requestImage(options: options) { [weak self] (result: ImageRequestResult<UIImage>) in
            if let image = result.image {
                self?.previewView.setImage(image)
                self?.splashView.isHidden = true
                self?.splashView.image = nil
            }
            completion?()
        }
    }
    
    func setImageTiltAngle(_ angle: Float) {
        previewView.setTiltAngle(angle.degreesToRadians())
    }
    
    func turnCounterclockwise() {
        previewView.turnCounterclockwise()
    }
    
    func setCroppingParameters(_ parameters: ImageCroppingParameters) {
        previewView.setCroppingParameters(parameters)
    }
    
    func setGridVisible(_ visible: Bool) {
        previewView.setGridVisible(visible)
    }
    
    func setCanvasSize(_ size: CGSize) {
        sourceImageMaxSize = size
    }
    
    func cropPreviewImage() -> CGImage? {
        return previewView.cropPreviewImage()
    }
}
