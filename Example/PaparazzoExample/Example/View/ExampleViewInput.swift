import Foundation

protocol ExampleViewInput: class {
    var onShowMediaPickerButtonTap: (() -> ())? { get set }
    var onShowSelfieCameraButtonTap: (() -> ())? { get set }
    var onShowPhotoLibraryButtonTap: (() -> ())? { get set }
}
