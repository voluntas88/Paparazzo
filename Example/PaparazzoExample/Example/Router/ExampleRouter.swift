import Marshroute
import Paparazzo

protocol ExampleRouter: class, RouterFocusable, RouterDismissable {

    func showMediaPicker(
        data: MediaPickerData,
        configure: (MediaPickerModule) -> ()
    )
    
    func showPhotoLibrary(
        selectedItems: [PhotoLibraryItem],
        maxSelectedItemsCount: Int?,
        configure: (PhotoLibraryModule) -> ()
    )
}
