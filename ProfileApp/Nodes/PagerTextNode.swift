//
//  HeaderTextNode.swift
//  ProfileApp
//
//  Created by Somaye Sabeti on 3/8/21.
//

import AsyncDisplayKit

class PagerTextNode: ASCellNode {
    
    var labelNode = ASTextNode()
    
    init(text: String) {
        super.init()
        automaticallyManagesSubnodes = true
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        labelNode.attributedText = NSAttributedString(string: text, attributes: [.font : UIFont.boldSystemFont(ofSize: 50)])
        
        let randomRed = CGFloat(arc4random_uniform(256))
        let randomGreen = CGFloat(arc4random_uniform(256))
        let randomBlue = CGFloat(arc4random_uniform(256))
        let myColor = UIColor(red: randomRed/255, green: randomGreen/255, blue: randomBlue/255, alpha: 1.0)
        backgroundColor = myColor
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let spec = ASInsetLayoutSpec(insets: .zero, child: labelNode)
        let wrapper = ASWrapperLayoutSpec(layoutElement: spec)
        wrapper.style.width = ASDimension(unit: .points, value: UIScreen.main.bounds.width / 4)
        return wrapper
    }
}


