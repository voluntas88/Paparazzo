public protocol SelfieCropperUITheme {
    var selfieCropperDiscardPhotoIcon: UIImage? { get }
    var selfieCropperCloseButtonIcon: UIImage? { get }
    
    var selfieCropperButtonsBackgroundNormalColor: UIColor { get }
    var selfieCropperButtonsBackgroundHighlightedColor: UIColor { get }
    var selfieCropperButtonsBackgroundDisabledColor: UIColor { get }
    var selfieCropperConfirmButtonTitleColor: UIColor { get }
    var selfieCropperConfirmButtonTitleHighlightedColor: UIColor { get }
    
    var selfieCropperConfirmButtonTitleFont: UIFont { get }
}
