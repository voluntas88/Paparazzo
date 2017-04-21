public final class AssemblyFactory:
    CameraAssemblyFactory,
    MediaPickerAssemblyFactory,
    PhotoLibraryAssemblyFactory,
    ImageCroppingAssemblyFactory,
    SelfieCropperAssemblyFactory
{
    
    private let theme: PaparazzoUITheme
    private let serviceFactory = ServiceFactoryImpl()
    
    public init(theme: PaparazzoUITheme = PaparazzoUITheme()) {
        self.theme = theme
    }
    
    func cameraAssembly() -> CameraAssembly {
        return CameraAssemblyImpl(theme: theme, serviceFactory: serviceFactory)
    }
    
    public func mediaPickerAssembly() -> MediaPickerAssembly {
        return MediaPickerAssemblyImpl(assemblyFactory: self, theme: theme, serviceFactory: serviceFactory)
    }

    func imageCroppingAssembly() -> ImageCroppingAssembly {
        return ImageCroppingAssemblyImpl(theme: theme, serviceFactory: serviceFactory)
    }

    public func photoLibraryAssembly() -> PhotoLibraryAssembly {
        return PhotoLibraryAssemblyImpl(theme: theme, serviceFactory: serviceFactory)
    }
    
    public func circleImageCroppingAssembly() -> SelfieCropperAssembly {
        return SelfieCropperAssemblyImpl(theme: theme, serviceFactory: serviceFactory)
    }

}
