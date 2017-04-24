public protocol UIThemeConfigurable {
    associatedtype ThemeType
    
    func setTheme(_ theme: ThemeType)
}
