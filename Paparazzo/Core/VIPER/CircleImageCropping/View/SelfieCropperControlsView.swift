import UIKit

final class SelfieCropperControlsView: UIView, UIThemeConfigurable {
    
    typealias UIThemeType = SelfieCropperUITheme
    
    // MARK: - Subviews
    
     private let discardButton = UIButton(type: .custom)
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        addSubview(discardButton)
        
        discardButton.addTarget(
            self,
            action: #selector(onDiscardTap(_:)),
            for: .touchUpInside
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        discardButton.size = CGSize(
            width: 30,
            height: 30
        )
        
        discardButton.centerX = centerX
        discardButton.bottom = height - 22
    }
    
    // MARK: - UIThemeConfigurable
    
    func setTheme(_ theme: UIThemeType) {
        discardButton.setImage(
            theme.selfieCropperDiscardPhotoIcon,
            for: .normal
        )
    }
    
    // MARK: - SelfieCropperControlsView
    
    var onDiscardTap: (() -> ())?
    
    func setControlsEnabled(_ enabled: Bool) {
        discardButton.isEnabled = enabled
    }
    
    // MARK: - Actions
    @objc private func onDiscardTap(_ sender: UIButton) {
        onDiscardTap?()
    }
}
