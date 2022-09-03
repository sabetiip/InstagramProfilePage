//
//  HeaderSectionController.swift
//  ProfileApp
//
//  Created by Somaye Sabeti on 3/8/21.
//

import AsyncDisplayKit

final class HeaderSectionController: ListSectionController, ASSectionController {
    
    var object: HeaderSectionModel?
    
    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        let id = object?.headers[index].id ?? -1
        return {
            return TextCellNode(text: "\(id)")
        }
    }
    
    override func numberOfItems() -> Int {
        return object?.headers.count ?? 0
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? HeaderSectionModel
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
        let size = CGSize(width: containerWidth, height: 60.0)
        return ASSizeRange(min: size, max: size)
    }
}

