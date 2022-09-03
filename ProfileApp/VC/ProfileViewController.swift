//
//  PofileViewController.swift
//  ProfileApp
//
//  Created by Somaye Sabeti on 3/3/21.
//

import AsyncDisplayKit

class ProfileViewController: ASDKViewController<ASDisplayNode> {
    
    var headerVC: HeaderViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.tp_configure(with: self, delegate: self)
    }
}

//MARK: - TPDataSource
extension ProfileViewController: TPDataSource {
    func headerViewController() -> UIViewController {
        headerVC = HeaderViewController(object: HeaderSectionModel(headers: [HeaderModel(), HeaderModel(), HeaderModel()]))
        return headerVC!
    }
    
    func bottomViewController() -> UIViewController & PagerAwareProtocol {
        return BottomPageContainerViewController(object: PageSectionModel(pages: [PageModel(), PageModel(), PageModel(), PageModel(), PageModel()]))
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
