import UIKit

class PaparazzoViewController: UIViewController, DisposeBag, DisposeBagHolder {
    // MARK: - DisposeBagHolder
    public let disposeBag: DisposeBag = DisposeBagImpl()
}
