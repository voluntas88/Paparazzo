import UIKit

final class ExampleView: UIView {
    
    var onShowMediaPickerButtonTap: (() -> ())?
    var onShowSelfieCameraButtonTap: (() -> ())?
    var onShowPhotoLibraryButtonTap: (() -> ())?
    
    private let mediaPickerButton = UIButton()
    private let selfieCameraButton = UIButton()
    private let photoLibraryButton = UIButton()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        mediaPickerButton.setTitle("Show Media Picker", for: .normal)
        mediaPickerButton.addTarget(
            self,
            action: #selector(onShowMediaPickerButtonTap(_:)),
            for: .touchUpInside
        )
        
        selfieCameraButton.setTitle("Show Selfie Camera", for: .normal)
        selfieCameraButton.addTarget(
            self,
            action: #selector(onShowSelfieCameraButtonTap(_:)),
            for: .touchUpInside
        )
        
        photoLibraryButton.setTitle("Show Photo Library", for: .normal)
        photoLibraryButton.addTarget(
            self,
            action: #selector(onShowPhotoLibraryButtonTap(_:)),
            for: .touchUpInside
        )
        
        addSubview(mediaPickerButton)
        addSubview(selfieCameraButton)
        addSubview(photoLibraryButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        mediaPickerButton.sizeToFit()
        mediaPickerButton.center = CGPoint(x: bounds.midX, y: bounds.midY - 50)
        
        selfieCameraButton.sizeToFit()
        selfieCameraButton.center = CGPoint(x: bounds.midX, y: bounds.midY)
        
        photoLibraryButton.sizeToFit()
        photoLibraryButton.center = CGPoint(x: bounds.midX, y: bounds.midY + 50)
    }
    
    // MARK: - Private
    
    @objc private func onShowMediaPickerButtonTap(_: UIButton) {
        onShowMediaPickerButtonTap?()
    }
    
    @objc private func onShowSelfieCameraButtonTap(_: UIButton) {
        onShowSelfieCameraButtonTap?()
    }
    
    @objc private func onShowPhotoLibraryButtonTap(_: UIButton) {
        onShowPhotoLibraryButtonTap?()
    }
}
