struct PaparazzoAssemblySeed {
    let theme: PaparazzoUITheme
    let serviceFactory: ServiceFactory
}

public class BasePaparazzoAssembly {
    // MARK: - Internal properties
    let theme: PaparazzoUITheme
    let serviceFactory: ServiceFactory
    
    init(assemblySeed: PaparazzoAssemblySeed) {
        self.theme = assemblySeed.theme
        self.serviceFactory = assemblySeed.serviceFactory
    }
    
}
