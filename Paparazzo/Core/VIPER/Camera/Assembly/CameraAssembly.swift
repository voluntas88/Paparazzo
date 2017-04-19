import UIKit

protocol CameraAssembly: class {
    func module() -> (UIView, CameraModuleInput)
}

protocol CameraAssemblyFactory {
    func cameraAssembly(initialActiveCameraType: CameraType) -> CameraAssembly
}
