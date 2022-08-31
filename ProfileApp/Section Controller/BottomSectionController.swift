//
//  BottomSectionController.swift
//  ProfileApp
//
//  Created by Somaye Sabeti on 3/8/21.
//

import AsyncDisplayKit

final class BottomSectionController: ListSectionController, ASSectionController {
    
    var object: PostModel?
    
    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        let id = object?.id ?? -1
        return {
            return PostCellNode(text: "\(id)")
        }
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? PostModel
    }
    
    override func didSelectItem(at index: Int) {}
    
    override func sizeForItem(at index: Int) -> CGSize {
        return ASIGListSectionControllerMethods.sizeForItem(at: index)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        return ASIGListSectionControllerMethods.cellForItem(at: index, sectionController: self)
    }
}

