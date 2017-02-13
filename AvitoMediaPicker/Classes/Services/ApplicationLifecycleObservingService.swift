protocol ApplicationLifecycleObservingService {
    var onApplicationWillResignActive: (() -> ())? { get set }
    var onApplicationDidBecomeActive: (() -> ())? { get set }
}

final class ApplicationLifecycleObservingServiceImpl: ApplicationLifecycleObservingService {
    var notificationCenter: NotificationCenter {
        return NotificationCenter.default
    }
    
    // MARK: - Init
    init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onApplicationWillResignActive(_:)),
            name: .UIApplicationWillResignActive,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onApplicationDidBecomeActive(_:)),
            name: .UIApplicationDidBecomeActive,
            object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - ApplicationLifecycleObservingService
    var onApplicationWillResignActive: (() -> ())?
    var onApplicationDidBecomeActive: (() -> ())?
    
    // MARK: - Private
    @objc private func onApplicationWillResignActive(_ sender: UIApplication) {
        onApplicationWillResignActive?()
    }
    
    @objc private func onApplicationDidBecomeActive(_ sender: UIApplication) {
        onApplicationDidBecomeActive?()
    }
}
