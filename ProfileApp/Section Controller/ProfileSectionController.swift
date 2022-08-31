//
//  FinalPostSectionController.swift
//  ExploreLayout
//
//  Created by Somaye Sabeti on 2/24/21.
//

import AsyncDisplayKit

final class ProfileSectionController: ListSectionController, ASSectionController {
    
    var object: UniquableModel?
    
    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        let id = object?.id ?? -1
        return {
            return TextCellNode(text: "\(id)")
        }
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? UniquableModel
    }
    
    override func didSelectItem(at index: Int) {}
    
    override func sizeForItem(at index: Int) -> CGSize {
        return ASIGListSectionControllerMethods.sizeForItem(at: index)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        return ASIGListSectionControllerMethods.cellForItem(at: index, sectionController: self)
    }
}
