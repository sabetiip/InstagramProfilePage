//
//  PagerCellNode.swift
//  ProfileApp
//
//  Created by Somaye Sabeti on 3/8/21.
//

import AsyncDisplayKit

class PagerCellNode: ASCellNode {
    
    var vc: ASDKViewController<ASCollectionNode>!
    
    init(vc: ASDKViewController<ASCollectionNode>) {
        super.init()
        automaticallyManagesSubnodes = true
        
        self.vc = vc
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let spec = ASInsetLayoutSpec(insets: .zero, child: vc.node)
        let wrapper = ASWrapperLayoutSpec(layoutElement: spec)
        wrapper.style.width = ASDimension(unit: .fraction, value: 1.0)
        wrapper.style.height = ASDimension(unit: .points, value: UIScreen.main.bounds.height)
        return wrapper
    }
}


