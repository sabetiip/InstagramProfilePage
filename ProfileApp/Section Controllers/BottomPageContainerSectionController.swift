import AsyncDisplayKit

final class BottomPageContainerSectionController: ListSectionController, ASSectionController {
    
    let selectPage: ((Int) -> ())?
    init(selectPage: ((Int) -> ())? = nil) {
        self.selectPage = selectPage
        super.init()
    }
    
    var object: PageSectionModel?
    
    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        let id = object?.pages[index].id ?? -1
        return {
            return PagerTextCellNode(text: "\(id)")
        }
    }
    
    override func numberOfItems() -> Int {
        return object?.pages.count ?? 0
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? PageSectionModel
    }
    
    override func didSelectItem(at index: Int) {
        self.selectPage?(index)
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return ASIGListSectionControllerMethods.sizeForItem(at: index)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        return ASIGListSectionControllerMethods.cellForItem(at: index, sectionController: self)
    }
    
    func sizeRangeForItem(at index: Int) -> ASSizeRange {
        let containerWidth = self.collectionContext?.containerSize.width ?? 0.0
        let containerHeight = self.collectionContext?.containerSize.height ?? 0.0
        let count: CGFloat = CGFloat(self.object?.pages.count ?? 0)
        let itemWidth = (containerWidth - (count * self.minimumInteritemSpacing)) / count
        let size = CGSize(width: itemWidth, height: containerHeight)
        return ASSizeRange(min: size, max: size)
    }
}


