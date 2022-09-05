import AsyncDisplayKit

class ProfileViewController: ASDKViewController<ASDisplayNode> {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.tp_configure(with: self, delegate: self)
    }
}

//MARK: - TPDataSource
extension ProfileViewController: TPDataSource {
    func headerViewController() -> UIViewController {
        return HeaderViewController(object: StaticData.headerDataModel)
    }
    
    func bottomViewController() -> UIViewController & PagerAwareProtocol {
        return BottomPageContainerViewController(bottomViewDataModel: StaticData.bottomDataModel)
    }
    
    func minHeaderHeight() -> CGFloat {
        return topInset
    }
}

//MARK: - TPProgressDelegate
extension ProfileViewController: TPProgressDelegate {
    func tp_scrollView(_ scrollView: UIScrollView, didUpdate progress: CGFloat) {
        
    }
    
    func tp_scrollViewDidLoad(_ scrollView: UIScrollView) {
        
    }
}
