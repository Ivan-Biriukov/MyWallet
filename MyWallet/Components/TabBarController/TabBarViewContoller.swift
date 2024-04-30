// MARK: - Imports

import UIKit

// MARK: - TabBarViewController

final class TabBarViewController: UITabBarController {
    
    // MARK: - properties
    struct ViewModel {
        var vc: UIViewController
        var title: String
        var image: UIImage
        var selectedImage: UIImage
    }
    
    var vcArray = [UIViewController](repeating: UIViewController(), count: 4)
    
    // MARK: - lifecycle func
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewControllers = vcArray
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
}

// MARK: - flow funcs

extension TabBarViewController {

    func configureVC(viewModels: [ViewModel]){
        vcArray = viewModels.map { viewModel in
            
            let vc = viewModel.vc
            vc.tabBarItem.title = viewModel.title
            vc.tabBarItem.image = viewModel.image
            vc.tabBarItem.selectedImage = viewModel.selectedImage
            
            return vc
        }
    }
    
    func setupUI() {
        tabBar.backgroundColor = MWPallete.tabBarBG
        tabBar.unselectedItemTintColor = .yellow
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.4
        tabBar.layer.shadowRadius = 4
    }
}
