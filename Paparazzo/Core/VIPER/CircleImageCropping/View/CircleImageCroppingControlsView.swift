import UIKit

final class CircleImageCroppingControlsView: UIView, UIThemeConfigurable {
    
    typealias UIThemeType = CircleImageCroppingUITheme
    
    // MARK: - Subviews
    
     private let deleteButton = UIButton(type: .custom)
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        addSubview(deleteButton)
        
        deleteButton.addTarget(
            self,
            action: #selector(onDeleteTap(_:)),
            for: .touchUpInside
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        deleteButton.size = CGSize(
            width: 30,
            height: 30
        )
        
        deleteButton.centerX = centerX
        deleteButton.bottom = height - 22
    }
    
    // MARK: - UIThemeConfigurable
    
    func setTheme(_ theme: UIThemeType) {
        deleteButton.setImage(
            theme.circleCropperRetakePhotoIcon,
            for: .normal
        )
    }
    
    // MARK: - CircleImageCroppingControlsView
    
    var onDeleteTap: (() -> ())?
    
    // MARK: - Actions
    @objc private func onDeleteTap(_ sender: UIButton) {
        onDeleteTap?()
    }
}
