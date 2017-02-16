import Foundation
import ImageSource

final class RoundedImageCroppingPresenter: RoundedImageCroppingModule {
    var onDiscard: (() -> ())?
    var onConfirm: ((ImageSource) -> ())?
}
