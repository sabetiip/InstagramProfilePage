//
//  BottomPageViewController.swift
//  ProfileApp
//
//  Created by Somaye Sabeti on 3/8/21.
//

import AsyncDisplayKit

class BottomPageViewController: ASDKViewController<ASPagerNode>, PagerAwareProtocol {
    
    //MARK: PagerAwareProtocol
    var pageDelegate: BottomPageDelegate?
    
    var currentViewController: UIViewController? {
        return vcs.first
    }
    
    var pagerTabHeight: CGFloat?{
        return 60
    }
    
    var bottomScrollView: UIScrollView {
        return vcs[self.node.currentPageIndex].node.view
    }

    let vcCount: Int
    
    init(vcCount: Int) {
        self.vcCount = vcCount
        super.init(node: ASPagerNode())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var vcs: [ASDKViewController<ASCollectionNode>] = {
        var vcList: [ASDKViewController<ASCollectionNode>] = []
        
        var posts = [PostModel]()
        for _ in 1 ... 5 {
            posts.append(PostModel())
        }
        var vc = BottomViewController(object: PostSectionModel(posts: posts))
        vcList.append(vc)
        
        posts = [PostModel]()
        for _ in 1 ... 20 {
            posts.append(PostModel())
        }
        vc = BottomViewController(object: PostSectionModel(posts: posts))
        vcList.append(vc)
        
        posts = [PostModel]()
        for _ in 1 ... 10 {
            posts.append(PostModel())
        }
        vc = BottomViewController(object: PostSectionModel(posts: posts))
        vcList.append(vc)
        
        posts = [PostModel]()
        for _ in 1 ... 30 {
            posts.append(PostModel())
        }
        vc = BottomViewController(object: PostSectionModel(posts: posts))
        vcList.append(vc)
        
        if vcCount > vcList.count {
            for _ in 0..<(vcCount - vcList.count) {
                posts = [PostModel]()
                for _ in 1 ... 50 {
                    posts.append(PostModel())
                }
                vc = BottomViewController(object: PostSectionModel(posts: posts))
                vcList.append(vc)
            }
        }
        
        return vcList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.node.setDelegate(self)
        self.node.setDataSource(self)
    }
}

extension BottomPageViewController: ASPagerDelegate, ASPagerDataSource {
    func numberOfPages(in pagerNode: ASPagerNode) -> Int {
        return vcs.count
    }
    
    func pagerNode(_ pagerNode: ASPagerNode, nodeAt index: Int) -> ASCellNode {
        return PagerCellNode(vc: vcs[index])
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageDelegate?.tp_pageViewController(vcs[self.node.currentPageIndex], didSelectPageAt: self.node.currentPageIndex)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageDelegate?.tp_pageViewController(vcs[self.node.currentPageIndex], didSelectPageAt: self.node.currentPageIndex)

    }
}
