import Marshroute
import Paparazzo

protocol ExampleRouter: class, RouterFocusable, RouterDismissable {

    func showMediaPicker(
        data: MediaPickerData,
        configure: (MediaPickerModule) -> ()
    )
    
    func showSelfieCropper(
        data: MediaPickerData,
        configure: (CircleImageCroppingModule) -> ()
    )
    
    func showPhotoLibrary(
        selectedItems: [PhotoLibraryItem],
        maxSelectedItemsCount: Int?,
        configure: (PhotoLibraryModule) -> ()
    )
}
