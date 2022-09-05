import AsyncDisplayKit

final class BottomSectionController: ListSectionController, ASSectionController {
    
    var object: PostSectionModel?
    
    override init() {
        super.init()
        self.minimumInteritemSpacing = 1.0
        self.minimumLineSpacing = 1.0
    }
    
    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        let id = object?.posts[index].id ?? -1
        return {
            return PostCellNode(text: "\(id)")
        }
    }
    
    override func numberOfItems() -> Int {
        return object?.posts.count ?? 1
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? PostSectionModel
    }
    
    override func didSelectItem(at index: Int) {}
    
    override func sizeForItem(at index: Int) -> CGSize {
        return ASIGListSectionControllerMethods.sizeForItem(at: index)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        return ASIGListSectionControllerMethods.cellForItem(at: index, sectionController: self)
    }
    
    func sizeRangeForItem(at index: Int) -> ASSizeRange {
        let containerWidth = self.collectionContext?.containerSize.width ?? 0.0
        let itemWidth = (containerWidth - (3 * self.minimumInteritemSpacing)) / 3.0
        let size = CGSize(width: itemWidth, height: itemWidth)
        return ASSizeRange(min: size, max: size)
    }
    
}

