public final class AssemblyFactory:
    CameraAssemblyFactory,
    MediaPickerAssemblyFactory,
    PhotoLibraryAssemblyFactory,
    ImageCroppingAssemblyFactory,
    CircleImageCroppingAssemblyFactory
{
    
    private let theme: PaparazzoUITheme
    
    public init(theme: PaparazzoUITheme = PaparazzoUITheme()) {
        self.theme = theme
    }
    
    func cameraAssembly(initialActiveCameraType: CameraType) -> CameraAssembly {
        return CameraAssemblyImpl(theme: theme, initialActiveCameraType: initialActiveCameraType)
    }
    
    public func mediaPickerAssembly() -> MediaPickerAssembly {
        return MediaPickerAssemblyImpl(assemblyFactory: self, theme: theme)
    }

    func imageCroppingAssembly() -> ImageCroppingAssembly {
        return ImageCroppingAssemblyImpl(theme: theme)
    }

    public func photoLibraryAssembly() -> PhotoLibraryAssembly {
        return PhotoLibraryAssemblyImpl(theme: theme)
    }
    
    public func circleImageCroppingAssembly() -> CircleImageCroppingAssembly {
        return CircleImageCroppingAssemblyImpl(theme: theme)
    }
}
