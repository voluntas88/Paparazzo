public protocol CircleImageCroppingUITheme {
    var circleCropperDiscardPhotoIcon: UIImage? { get }
    var circleCropperCloseButtonIcon: UIImage? { get }
    
    var circleCropperButtonsBackgroundNormalColor: UIColor { get }
    var circleCropperButtonsBackgroundHighlightedColor: UIColor { get }
    var circleCropperButtonsBackgroundDisabledColor: UIColor { get }
    var circleCropperConfirmButtonTitleColor: UIColor { get }
    var circleCropperConfirmButtonTitleHighlightedColor: UIColor { get }
    
    var circleCropperConfirmButtonTitleFont: UIFont { get }
}
