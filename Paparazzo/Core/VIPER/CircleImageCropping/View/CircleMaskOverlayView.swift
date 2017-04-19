final class CircleMaskOverlayView: UIView {
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        isOpaque = false
    }
    
    func frameToCrop() -> CGRect {
        let diameter = bounds.size.width - 16
        return CGRect(
            origin: CGPoint(
                x: center.x - diameter / 2,
                y: center.y - diameter / 2
            ),
            size: CGSize(
                width: diameter,
                height: diameter
            )
        )
    }
    
    // MARK: - Draw
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.white.withAlphaComponent(0.6).cgColor)
        context?.fill(rect)
        context?.saveGState()
        context?.setBlendMode(.clear)
        
        let frame = frameToCrop()
        if rect.intersects(frame) {
            context?.setFillColor(UIColor.clear.cgColor)
            context?.fillEllipse(in: frame)
        }
        
        context?.restoreGState()
    }
    
    // MARK: - Unused
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
