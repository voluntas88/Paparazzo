import UIKit

final class CircleImageCroppingControlsView: UIView {
    
    // MARK: - Subviews
    
     private let deleteButton = UIButton(type: .custom)
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
//        deleteButton.size = CGSize(
//            width: 30,
//            height: 30
//        )
//        
//        deleteButton.centerX = centerX
//        deleteButton.bottom = height - 22
    }
    
    // MARK: - CircleImageCroppingControlsView
    
    var onDeleteTap: (() -> ())?
}
