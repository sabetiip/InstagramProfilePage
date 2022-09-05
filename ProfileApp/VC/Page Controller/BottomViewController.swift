import AsyncDisplayKit

class BottomViewController: ASDKViewController<ASCollectionNode> {
        
    lazy var adapter: ListAdapter = .init(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    
    let object: PostSectionModel
    
    init(object: PostSectionModel) {
        self.object = object
        super.init(node: ASCollectionNode(collectionViewLayout: UICollectionViewFlowLayout()))
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
        return [object]
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
