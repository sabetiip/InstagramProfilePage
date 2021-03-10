//
//  HeaderViewController.swift
//  ProfileApp
//
//  Created by Somaye Sabeti on 3/8/21.
//

import AsyncDisplayKit

class HeaderViewController: ASDKViewController<ASCollectionNode> {
    
    let flowLayout = UICollectionViewFlowLayout()
    var objects: [ProfileCellModel] = []
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    override init() {
        super.init(node: ASCollectionNode(collectionViewLayout: flowLayout))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        insertItems()
        
        adapter.setASDKCollectionNode(node)
        adapter.dataSource = self
    }
    
    //MARK: - Test
    private func insertItems() {
        objects.append(ProfileCellModel())
        objects.append(ProfileCellModel())
        objects.append(ProfileCellModel())
        
        adapter.performUpdates(animated: false)
    }
}

//MARK: - ListAdapterDataSource
extension HeaderViewController: ListAdapterDataSource {
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return HeaderSectionController()
    }

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return objects
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
