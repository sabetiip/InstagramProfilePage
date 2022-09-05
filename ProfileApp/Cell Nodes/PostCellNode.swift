import AsyncDisplayKit

class PostCellNode: ASCellNode {
    
    var labelNode = ASTextNode()
    
    init(text: String) {
        super.init()
        automaticallyManagesSubnodes = true
        
        backgroundColor = UIColor().random
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        labelNode.attributedText = NSAttributedString(string: text, attributes: [.font : UIFont.boldSystemFont(ofSize: 50)])
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let spec = ASInsetLayoutSpec(insets: .zero, child: labelNode)
        let centerSpec = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: spec)
        return centerSpec
    }
}
