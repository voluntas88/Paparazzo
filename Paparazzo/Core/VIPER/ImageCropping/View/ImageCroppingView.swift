import ImageSource
import UIKit

final class ImageCroppingView: UIView, UIThemeConfigurable {
    
    typealias UIThemeType = ImageCroppingUITheme
    
    // MARK: - Subviews
    
    private let croppingPreviewView = CroppingPreviewView()
    private let controlsView = ImageCroppingControlsView()
    private let aspectRatioButton = UIButton()
    private let titleLabel = UILabel()
    
    // MARK: - Constants
    
    private let controlsMinHeight: CGFloat = {
        let iPhone5ScreenSize = CGSize(width: 320, height: 568)
        return iPhone5ScreenSize.height - iPhone5ScreenSize.width / 0.75
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        clipsToBounds = true
        
        aspectRatioButton.layer.borderWidth = 1
        aspectRatioButton.setTitleColor(.black, for: .normal)
        aspectRatioButton.addTarget(
            self,
            action: #selector(onAspectRatioButtonTap(_:)),
            for: .touchUpInside
        )
        
        controlsView.onConfirmButtonTap = { [weak self] in
            self?.onConfirmButtonTap?(self?.croppingPreviewView.cropPreviewImage())
        }

        addSubview(croppingPreviewView)
        addSubview(controlsView)
        addSubview(titleLabel)
        addSubview(aspectRatioButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        aspectRatioButton.top = 14
        aspectRatioButton.right = bounds.right - 12
        
        titleLabel.resizeToFitWidth(bounds.size.width - 2 * (bounds.right - aspectRatioButton.left))
        titleLabel.centerX = bounds.centerX
        titleLabel.top = 13
        
        controlsView.layout(
            left: bounds.left,
            right: bounds.right,
            bottom: bounds.bottom,
            height: max(controlsMinHeight, bounds.size.height - bounds.size.width / 0.75)   // оставляем вверху место под фотку 3:4
        )
        
        croppingPreviewView.layout(
            left: bounds.left,
            right: bounds.right,
            top: bounds.top,
            bottom: controlsView.top
        )
        croppingPreviewView.layoutSplashViewIn(bounds: bounds)
    }
    
    // MARK: - UIThemeConfigurable
    
    func setTheme(_ theme: UIThemeType) {
        controlsView.setTheme(theme)
    }
    
    // MARK: - ImageCroppingView
    
    var onDiscardButtonTap: (() -> ())? {
        get { return controlsView.onDiscardButtonTap }
        set { controlsView.onDiscardButtonTap = newValue }
    }
    
    var onConfirmButtonTap: ((_ previewImage: CGImage?) -> ())?
    
    var onRotationAngleChange: ((Float) -> ())? {
        get { return controlsView.onRotationAngleChange }
        set { controlsView.onRotationAngleChange = newValue }
    }
    
    var onRotateButtonTap: (() -> ())? {
        get { return controlsView.onRotateButtonTap }
        set { controlsView.onRotateButtonTap = newValue }
    }
    
    var onRotationCancelButtonTap: (() -> ())? {
        get { return controlsView.onRotationCancelButtonTap }
        set { controlsView.onRotationCancelButtonTap = newValue }
    }
    
    var onGridButtonTap: (() -> ())? {
        get { return controlsView.onGridButtonTap }
        set { controlsView.onGridButtonTap = newValue }
    }
    
    var onAspectRatioButtonTap: (() -> ())?
    
    var onCroppingParametersChange: ((ImageCroppingParameters) -> ())? {
        get { return croppingPreviewView.onCroppingParametersChange }
        set { croppingPreviewView.onCroppingParametersChange = newValue }
    }
    
    func setImage(_ image: ImageSource, previewImage: ImageSource?, completion: (() -> ())?) {
        croppingPreviewView.setImage(image, previewImage: previewImage, completion: completion)
    }
    
    func setImageTiltAngle(_ angle: Float) {
        croppingPreviewView.setImageTiltAngle(angle)
    }

    func turnCounterclockwise() {
        croppingPreviewView.turnCounterclockwise()
    }
    
    func setCroppingParameters(_ parameters: ImageCroppingParameters) {
        croppingPreviewView.setCroppingParameters(parameters)
    }
    
    func setRotationSliderValue(_ value: Float) {
        controlsView.setRotationSliderValue(value)
    }
    
    func setCanvasSize(_ size: CGSize) {
        croppingPreviewView.setCanvasSize(size)
    }
    
    func setControlsEnabled(_ enabled: Bool) {
        controlsView.setControlsEnabled(enabled)
        aspectRatioButton.isEnabled = enabled
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setAspectRatio(_ aspectRatio: AspectRatio) {
        
        self.aspectRatio = aspectRatio
        
        aspectRatioButton.size = aspectRatioButtonSize()
        croppingPreviewView.cropAspectRatio = CGFloat(aspectRatio.widthToHeightRatio())
        
        switch aspectRatio {
        
        case .portrait_3x4:
            
            titleLabel.textColor = .white
            
            aspectRatioButton.setTitleColor(.white, for: .normal)
            aspectRatioButton.layer.borderColor = UIColor.white.cgColor
            
            setShadowVisible(true, forView: titleLabel)
            setShadowVisible(true, forView: aspectRatioButton)
        
        case .landscape_4x3:
            
            titleLabel.textColor = .black
            
            aspectRatioButton.setTitleColor(.black, for: .normal)
            aspectRatioButton.layer.borderColor = UIColor.black.cgColor
            
            setShadowVisible(false, forView: titleLabel)
            setShadowVisible(false, forView: aspectRatioButton)
        }
        
        croppingPreviewView.layoutSplashViewIn(bounds: bounds)
    }
    
    func setAspectRatioButtonTitle(_ title: String) {
        aspectRatioButton.setTitle(title, for: .normal)
    }
    
    func setMinimumRotation(_ degrees: Float) {
        controlsView.setMinimumRotation(degrees: degrees)
    }
    
    func setMaximumRotation(_ degrees: Float) {
        controlsView.setMaximumRotation(degrees: degrees)
    }
    
    func setCancelRotationButtonTitle(_ title: String) {
        controlsView.setCancelRotationButtonTitle(title)
    }
    
    func setCancelRotationButtonVisible(_ visible: Bool) {
        controlsView.setCancelRotationButtonVisible(visible)
    }
    
    func setGridVisible(_ visible: Bool) {
        croppingPreviewView.setGridVisible(visible)
    }
    
    func setGridButtonSelected(_ selected: Bool) {
        controlsView.setGridButtonSelected(selected)
    }
    
    // MARK: - Private
    
    private var aspectRatio: AspectRatio = .portrait_3x4
    
    private func aspectRatioButtonSize() -> CGSize {
        switch aspectRatio {
        case .portrait_3x4:
            return CGSize(width: 34, height: 42)
        case .landscape_4x3:
            return CGSize(width: 42, height: 34)
        }
    }

    private func setShadowVisible(_ visible: Bool, forView view: UIView) {
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = visible ? 0.5 : 0
        view.layer.shadowRadius = 1
        view.layer.masksToBounds = false
    }
    
    @objc private func onAspectRatioButtonTap(_ sender: UIButton) {
        onAspectRatioButtonTap?()
    }
}
