import Marshroute
import Paparazzo

protocol ExampleRouter: class, RouterFocusable, RouterDismissable {

    func showMediaPicker(
        data: MediaPickerData,
        configure: (MediaPickerModule) -> ()
    )
    
    func showSelfieCropper(
        data: SelfieCropperData,
        configure: (SelfieCropperModule) -> ()
    )
    
    func showPhotoLibrary(
        selectedItems: [PhotoLibraryItem],
        maxSelectedItemsCount: Int?,
        configure: (PhotoLibraryModule) -> ()
    )
}
