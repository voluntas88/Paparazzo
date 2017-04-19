public protocol UIThemeConfigurable {
    associatedtype UIThemeType
    
    func setTheme(_ theme: UIThemeType)
}
