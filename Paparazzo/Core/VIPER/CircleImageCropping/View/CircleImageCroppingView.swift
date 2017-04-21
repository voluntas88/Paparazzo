import ImageSource
import UIKit

final class CircleImageCroppingView: UIView, UIThemeConfigurable {
    
    typealias UIThemeType = CircleImageCroppingUITheme
    
    private let overlayView = CircleMaskOverlayView()
    private let controlsView = CircleImageCroppingControlsView()
    private let previewView = CroppingPreviewView()
    private let closeButton = UIButton()
    private let confirmButton = UIButton()
    
    // MARK: - Constants
    
    private let aspectRatio = CGFloat(AspectRatio.portrait_3x4.widthToHeightRatio())
    private let closeButtonSize = CGSize(width: 38, height: 38)
    private let continueButtonHeight = CGFloat(38)
    private let continueButtonContentInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        clipsToBounds = true
        
        previewView.setGridVisible(false)
        
        addSubview(previewView)
        addSubview(overlayView)
        addSubview(controlsView)
        addSubview(closeButton)
        addSubview(confirmButton)
        
        setupButtons()
        
        overlayView.isUserInteractionEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIThemeConfigurable
    
    func setTheme(_ theme: CircleImageCroppingUITheme) {
        controlsView.setTheme(theme)
        
        confirmButton.setTitleColor(theme.circleCropperConfirmButtonTitleColor, for: .normal)
        confirmButton.titleLabel?.font = theme.circleCropperConfirmButtonTitleFont
        
        closeButton.setImage(theme.circleCropperCloseButtonIcon, for: .normal)
        
        confirmButton.setTitleColor(
            theme.circleCropperConfirmButtonTitleColor,
            for: .normal
        )
        confirmButton.setTitleColor(
            theme.circleCropperConfirmButtonTitleHighlightedColor,
            for: .highlighted
        )
        
        let onePointSize = CGSize(width: 1, height: 1)
        for button in [confirmButton, closeButton] {
            button.setBackgroundImage(
                UIImage.imageWithColor(theme.circleCropperButtonsBackgroundNormalColor, imageSize: onePointSize),
                for: .normal
            )
            button.setBackgroundImage(
                UIImage.imageWithColor(theme.circleCropperButtonsBackgroundHighlightedColor, imageSize: onePointSize),
                for: .highlighted
            )
            button.setBackgroundImage(
                UIImage.imageWithColor(theme.circleCropperButtonsBackgroundDisabledColor, imageSize: onePointSize),
                for: .disabled
            )
        }
    }
    
    // MARK: - Layout
    
    public override func layoutSubviews() {
        
        previewView.width = width
        previewView.height = height * aspectRatio
        
        overlayView.frame = previewView.frame
        
        controlsView.top = previewView.bottom
        controlsView.width = width
        controlsView.height = height - previewView.height
        
        closeButton.frame = CGRect(
            x: 8,
            y: 8,
            width: closeButton.width,
            height: closeButton.height
        )
        
        confirmButton.frame = CGRect(
            x: bounds.right - 8 - confirmButton.width,
            y: 8,
            width: confirmButton.width,
            height: confirmButton.height
        )
    }
    
    // MARK: - CircleImageCroppingView
    
    var onCloseButtonTap: (() -> ())?
    var onConfirmButtonTap: ((_ previewImage: CGImage?) -> ())?
    
    var onDiscardTap: (() -> ())? {
        get { return controlsView.onDiscardTap }
        set { controlsView.onDiscardTap = newValue }
    }
    
    func setCroppingParameters(_ parameters: ImageCroppingParameters) {
        previewView.setCroppingParameters(parameters)
    }
    
    func setImage(_ imageSource: ImageSource, previewImage: ImageSource?, completion: @escaping () -> ()) {
        previewView.setImage(imageSource, previewImage: previewImage, completion: completion)
    }
    
    func setCanvasSize(_ canvasSize: CGSize) {
        previewView.setCanvasSize(canvasSize)
    }
    
    func setControlsEnabled(_ enabled: Bool) {
        controlsView.setControlsEnabled(enabled)
    }
    
    // MARK: - Private
    
    private func setupButtons() {
        closeButton.layer.cornerRadius = closeButtonSize.height / 2
        closeButton.layer.masksToBounds = true
        closeButton.size = closeButtonSize
        closeButton.addTarget(
            self,
            action: #selector(onCloseButtonTap(_:)),
            for: .touchUpInside
        )
        
        confirmButton.layer.cornerRadius = continueButtonHeight / 2
        confirmButton.layer.masksToBounds = true
        confirmButton.contentEdgeInsets = continueButtonContentInsets
        confirmButton.addTarget(
            self,
            action: #selector(onConfirmButtonTap(_:)),
            for: .touchUpInside
        )
    }
    
    @objc private func onCloseButtonTap(_: UIButton) {
        onCloseButtonTap?()
    }
    
    @objc private func onConfirmButtonTap(_: UIButton) {
        onConfirmButtonTap?(previewView.cropPreviewImage())
    }
    
}
