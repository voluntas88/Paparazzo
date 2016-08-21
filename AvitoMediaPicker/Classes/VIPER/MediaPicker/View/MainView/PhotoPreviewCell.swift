import UIKit

final class PhotoPreviewCell: PhotoCollectionViewCell {
    
    private let progressIndicator = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImageViewContentMode(.ScaleAspectFit)
        
        progressIndicator.hidesWhenStopped = true
        addSubview(progressIndicator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        progressIndicator.center = bounds.center
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        progressIndicator.stopAnimating()
    }
    
    override func adjustImageRequestOptions(inout options: ImageRequestOptions) {
        super.adjustImageRequestOptions(&options)
        
        options.onDownloadStart = { [weak self, superOptions = options] in
            superOptions.onDownloadStart?()
            self?.progressIndicator.startAnimating()
        }
        
        options.onDownloadFinish = { [weak self, superOptions = options] in
            superOptions.onDownloadFinish?()
            self?.progressIndicator.stopAnimating()
        }
    }
    
    // MARK: - Customizable
    
    func customizeWithItem(item: MediaPickerItem) {
        imageSource = item.image
    }
}
