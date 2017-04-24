import ImageSource

protocol ServiceFactory: CroppingOverlayProvidersFactory {
    func deviceOrientationService() -> DeviceOrientationService
    func cameraService(initialActiveCameraType: CameraType) -> CameraService
    func photoLibraryLatestPhotoProvider() -> PhotoLibraryLatestPhotoProvider
    func imageCroppingService(image: ImageSource, canvasSize: CGSize) -> ImageCroppingService
}

final class ServiceFactoryImpl: ServiceFactory {
    
    func deviceOrientationService() -> DeviceOrientationService {
        return DeviceOrientationServiceImpl()
    }
    
    func cameraService(initialActiveCameraType: CameraType) -> CameraService {
        return CameraServiceImpl(initialActiveCameraType: initialActiveCameraType)
    }
    
    func photoLibraryLatestPhotoProvider() -> PhotoLibraryLatestPhotoProvider {
        return PhotoLibraryLatestPhotoProviderImpl()
    }
    
    func circleCroppingOverlayProvider() -> CroppingOverlayProvider {
        return CircleCroppingOverlayProvider()
    }
    
    func rectangleCroppingOverlayProvider(cornerRadius: CGFloat, margin: CGFloat) -> CroppingOverlayProvider {
        return RectangleCroppingOverlayProvider(cornerRadius: cornerRadius, margin: margin)
    }
    
    func heartShapeCroppingOverlayProvider() -> CroppingOverlayProvider {
        return HeartShapeCroppingOverlayProvider()
    }
    
    func imageCroppingService(image: ImageSource, canvasSize: CGSize) -> ImageCroppingService {
        return ImageCroppingServiceImpl(image: image, canvasSize: canvasSize)
    }
    
}
