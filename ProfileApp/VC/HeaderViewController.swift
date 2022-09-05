//
import AsyncDisplayKit

class HeaderViewController: ASDKViewController<ASCollectionNode> {
    
    let object: HeaderSectionModel
    
    lazy var adapter: ListAdapter = .init(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    
    init(object: HeaderSectionModel) {
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
extension HeaderViewController: ListAdapterDataSource {
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return HeaderSectionController()
    }

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [object]
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
