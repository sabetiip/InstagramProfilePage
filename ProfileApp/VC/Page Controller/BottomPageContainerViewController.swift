//
//  BottomPageContainerViewController.swift
//  ProfileApp
//
//  Created by Somaye Sabeti on 3/8/21.
//

import AsyncDisplayKit

class BottomPageContainerViewController: ASDKViewController<ASDisplayNode>, PagerAwareProtocol {
    
    let flowLayout = UICollectionViewFlowLayout()
    var objects: [HeaderPostsModel] = []
    
    let collectionNode: ASCollectionNode!
    let pagerContainer = UIView()
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    weak var pageDelegate: BottomPageDelegate?
    
    var currentViewController: UIViewController?{
        return pager?.currentViewController
    }
    
    var pagerTabHeight: CGFloat?{
        return pager?.pagerTabHeight
    }
    
    var bottomScrollView: UIScrollView {
        return pager?.bottomScrollView ?? UIScrollView()
    }
    
    var pager: BottomPageViewController?
    
    override init() {
        self.collectionNode = ASCollectionNode(collectionViewLayout: flowLayout)
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        flowLayout.scrollDirection = .horizontal
        
        insertItems()
        
        adapter.setASDKCollectionNode(collectionNode)
        adapter.dataSource = self
        
        collectionNode.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionNode.view)
        NSLayoutConstraint.activate([
            collectionNode.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionNode.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionNode.view.topAnchor.constraint(equalTo: view.topAnchor),
            collectionNode.view.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        // add container
        pagerContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pagerContainer)
        NSLayoutConstraint.activate([
            pagerContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pagerContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pagerContainer.topAnchor.constraint(equalTo: collectionNode.view.bottomAnchor),
            pagerContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        // add child view controller view to container
        let controller = BottomPageViewController()
        self.add(controller, to: pagerContainer)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: pagerContainer.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: pagerContainer.trailingAnchor),
            controller.view.topAnchor.constraint(equalTo: pagerContainer.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: pagerContainer.bottomAnchor)
        ])
        
        pager = controller
        pager!.pageDelegate = pageDelegate
    }
    
    //MARK: - Test
    private func insertItems() {
        objects.append(HeaderPostsModel())
        objects.append(HeaderPostsModel())
        objects.append(HeaderPostsModel())
        objects.append(HeaderPostsModel())
        
        adapter.performUpdates(animated: false)
    }
}

//MARK: - ListAdapterDataSource
extension BottomPageContainerViewController: ListAdapterDataSource {
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return BottomPageContainerSectionController()
    }

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return objects
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
