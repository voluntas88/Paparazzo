import UIKit

final class CameraAssemblyImpl: CameraAssembly {
    
    private let theme: MediaPickerRootModuleUITheme
    private let initialActiveCameraType: CameraType
    
    init(theme: MediaPickerRootModuleUITheme, initialActiveCameraType: CameraType)
    {
        self.theme = theme
        self.initialActiveCameraType = initialActiveCameraType
    }
    
    // MARK: - CameraAssembly
    
    func module() -> (UIView, CameraModuleInput) {
        
        let cameraService = CameraServiceImpl(initialActiveCameraType: initialActiveCameraType)
        let deviceOrientationService = DeviceOrientationServiceImpl()
        
        let interactor = CameraInteractorImpl(
            cameraService: cameraService,
            deviceOrientationService: deviceOrientationService
        )
        
        let presenter = CameraPresenter(
            interactor: interactor
        )
        
        let view = CameraView()
        view.addDisposable(presenter)
        view.setTheme(theme)
        
        presenter.view = view
        
        return (view, presenter)
    }
}
