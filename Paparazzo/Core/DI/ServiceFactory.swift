protocol ServiceFactory: CroppingOverlayProvidersFactory {
    func deviceOrientationService() -> DeviceOrientationService
    func cameraService(initialActiveCameraType: CameraType) -> CameraService
    func photoLibraryLatestPhotoProvider() -> PhotoLibraryLatestPhotoProvider
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
    
    func circleCroppingOverlayProvider() -> CircleCroppingOverlayProvider {
        return CircleCroppingOverlayProvider()
    }
    
    func rectangleCroppingOverlayProvider(cornerRadius: CGFloat, margin: CGFloat) -> RectangleCroppingOverlayProvider {
        return RectangleCroppingOverlayProvider(cornerRadius: cornerRadius, margin: margin)
    }
    
    func heartShapeCroppingOverlayProvider() -> HeartShapeCroppingOverlayProvider {
        return HeartShapeCroppingOverlayProvider()
    }
    
}
