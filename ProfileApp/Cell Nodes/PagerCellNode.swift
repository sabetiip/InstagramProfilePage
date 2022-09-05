import AsyncDisplayKit

class PagerCellNode: ASCellNode {
    
    let vc: ASDKViewController<ASCollectionNode>
    
    init(vc: ASDKViewController<ASCollectionNode>) {
        self.vc = vc
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let spec = ASInsetLayoutSpec(insets: .zero, child: vc.node)
        let wrapper = ASWrapperLayoutSpec(layoutElement: spec)
        wrapper.style.width = ASDimension(unit: .fraction, value: 1.0)
        wrapper.style.height = ASDimension(unit: .points, value: UIScreen.main.bounds.height)
        return wrapper
    }
}


