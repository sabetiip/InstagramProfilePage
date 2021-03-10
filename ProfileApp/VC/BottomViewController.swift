//
//  BottomViewController.swift
//  ProfileApp
//
//  Created by Somaye Sabeti on 3/8/21.
//

import AsyncDisplayKit

class BottomViewController: ASDKViewController<ASCollectionNode> {
    
    let flowLayout = UICollectionViewFlowLayout()
    var objects: [PostModel] = []
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    init(objects: [PostModel]) {
        super.init(node: ASCollectionNode(collectionViewLayout: flowLayout))
        self.objects = objects
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        adapter.setASDKCollectionNode(node)
        adapter.dataSource = self
    }
}

//MARK: - ListAdapterDataSource
extension BottomViewController: ListAdapterDataSource {
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return BottomSectionController()
    }

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return objects
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
