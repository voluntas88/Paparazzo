import UIKit

public struct PhotoLibrarySeed {
    public let selectedItems: [PhotoLibraryItem]
    public let maxSelectedItemsCount: Int?
    
    public init(
        selectedItems: [PhotoLibraryItem],
        maxSelectedItemsCount: Int?)
    {
        self.selectedItems = selectedItems
        self.maxSelectedItemsCount = maxSelectedItemsCount
    }
}
