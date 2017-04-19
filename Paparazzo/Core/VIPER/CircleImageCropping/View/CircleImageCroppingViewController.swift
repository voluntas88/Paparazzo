final class CircleImageCroppingViewController:
    UIViewController,
    CircleImageCroppingViewInput,
    UIThemeConfigurable
{
    
    typealias UIThemeType = CircleImageCroppingUITheme
    
    // MARK: - UIThemeConfigurable
    
    func setTheme(_ theme: UIThemeType) {
        
    }
    
    // MARK: - Dispose bag
    
    private var disposables = [AnyObject]()
    
    func addDisposable(_ object: AnyObject) {
        disposables.append(object)
    }
    
}
