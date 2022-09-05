import AsyncDisplayKit

class BottomPageViewController: ASDKViewController<ASPagerNode>, PagerAwareProtocol {
    
    //MARK: - PagerAwareProtocol
    var pageDelegate: BottomPageDelegate?
    
    var currentViewController: UIViewController? {
        return bottomVCs.first
    }
    
    var pagerTabHeight: CGFloat?{
        return pagerCollectionHeight
    }
    
    var bottomScrollView: UIScrollView {
        return bottomVCs[self.node.currentPageIndex].node.view
    }

    //MARK: -
    let postSectionModels: [PostSectionModel]
    
    init(postSectionModels: [PostSectionModel]) {
        self.postSectionModels = postSectionModels
        super.init(node: ASPagerNode())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var bottomVCs: [ASDKViewController<ASCollectionNode>] = {
        return self.postSectionModels.map({ BottomViewController(object: $0) })
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.node.setDelegate(self)
        self.node.setDataSource(self)
    }
}

//MARK: - ASPagerDelegate, ASPagerDataSource
extension BottomPageViewController: ASPagerDelegate, ASPagerDataSource {
    func numberOfPages(in pagerNode: ASPagerNode) -> Int {
        return bottomVCs.count
    }
    
    func pagerNode(_ pagerNode: ASPagerNode, nodeAt index: Int) -> ASCellNode {
        return PagerCellNode(vc: bottomVCs[index])
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageDelegate?.tp_pageViewController(bottomVCs[self.node.currentPageIndex], didSelectPageAt: self.node.currentPageIndex)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageDelegate?.tp_pageViewController(bottomVCs[self.node.currentPageIndex], didSelectPageAt: self.node.currentPageIndex)

    }
}
