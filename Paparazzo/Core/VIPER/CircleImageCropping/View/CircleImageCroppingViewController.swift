import ImageSource

final class CircleImageCroppingViewController:
    PaparazzoViewController,
    CircleImageCroppingViewInput,
    UIThemeConfigurable
{
    
    typealias UIThemeType = CircleImageCroppingUITheme
    
    private let circleImageCroppingView = CircleImageCroppingView()
    
    // MARK: - UIViewController
    
    override func loadView() {
        view = circleImageCroppingView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Cropping doesn't work in landscape at the moment.
        // Forcing orientation doesn't produce severe issues at the moment.
        forcePortraitOrientation()
        navigationController?.setNavigationBarHidden(true, animated: animated)
        UIApplication.shared.setStatusBarHidden(true, with: .fade)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // MARK: - CircleImageCroppingViewInput
    
    var onConfirmButtonTap: ((CGImage?) -> ())? {
        get { return circleImageCroppingView.onConfirmButtonTap }
        set { circleImageCroppingView.onConfirmButtonTap = newValue }
    }
    
    var onCloseButtonTap: (() -> ())? {
        get { return circleImageCroppingView.onCloseButtonTap }
        set { circleImageCroppingView.onCloseButtonTap = newValue }
    }
    
    var onRetakePhotoButtonTap: (() -> ())?
    
    var onCroppingParametersChange: ((ImageCroppingParameters) -> ())?
    
    @nonobjc func setTitle(_ title: String) {
        
    }
    
    func setImage(_ imageSource: ImageSource, previewImage: ImageSource?, completion: @escaping () -> ()) {
        
    }
    
    func setCanvasSize(_ canvasSize: CGSize) {
        
    }
    
    func setControlsEnabled(_ controlsEnabled: Bool) {
        
    }
    
    func setCroppingParameters(_ parameters: ImageCroppingParameters) {
        
    }
    
    // MARK: - UIThemeConfigurable
    
    func setTheme(_ theme: UIThemeType) {
        circleImageCroppingView.setTheme(theme)
    }
    
    // MARK: - Private
    
    private func forcePortraitOrientation() {
        let initialDeviceOrientation = UIDevice.current.orientation
        let targetDeviceOrientation = UIDeviceOrientation.portrait
        let targetInterfaceOrientation = UIInterfaceOrientation.portrait
        
        if UIDevice.current.orientation != targetDeviceOrientation {
            
            UIApplication.shared.setStatusBarOrientation(targetInterfaceOrientation, animated: true)
            UIDevice.current.setValue(NSNumber(value: targetInterfaceOrientation.rawValue as Int), forKey: "orientation")
            
            DispatchQueue.main.async {
                UIDevice.current.setValue(NSNumber(value: initialDeviceOrientation.rawValue as Int), forKey: "orientation")
            }
        }
    }
    
}
