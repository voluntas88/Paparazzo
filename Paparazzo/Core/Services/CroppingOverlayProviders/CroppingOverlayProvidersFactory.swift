protocol CroppingOverlayProvidersFactory {
    func circleCroppingOverlayProvider() -> CroppingOverlayProvider
    func rectangleCroppingOverlayProvider(cornerRadius: CGFloat, margin: CGFloat) -> CroppingOverlayProvider
    func heartShapeCroppingOverlayProvider() -> CroppingOverlayProvider
}
