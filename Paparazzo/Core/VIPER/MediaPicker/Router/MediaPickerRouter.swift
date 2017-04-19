import ImageSource

protocol MediaPickerRouter: class {
    
    func showPhotoLibrary(
        seed: PhotoLibrarySeed,
        configure: (PhotoLibraryModule) -> ()
    )
    
    func showCroppingModule(
        forImage: ImageSource,
        canvasSize: CGSize,
        configure: (ImageCroppingModule) -> ()
    )
    
    func focusOnCurrentModule()
    func dismissCurrentModule()
}
