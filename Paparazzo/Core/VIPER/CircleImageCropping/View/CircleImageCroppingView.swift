import ImageSource
import UIKit

final class CircleImageCroppingView: UIView {
    
    private let overlayView = CircleMaskOverlayView()
    private let previewView = PhotoTweakView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
