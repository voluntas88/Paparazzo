protocol CroppingOverlayProvidersFactory {
    func circleCroppingOverlayProvider() -> CircleCroppingOverlayProvider
    func rectangleCroppingOverlayProvider(cornerRadius: CGFloat, margin: CGFloat) -> RectangleCroppingOverlayProvider
    func heartShapeCroppingOverlayProvider() -> HeartShapeCroppingOverlayProvider
}
