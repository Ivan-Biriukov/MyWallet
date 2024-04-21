// MARK: - Imports

import UIKit
import SnapKit

// MARK: - MainView

final class MainView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let mainCollectionViewItemSize: CGSize = CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 3.5)
        static let firstSectionCollectionItemSize: CGSize = CGSize(width: UIScreen.main.bounds.width - 10, height: 60)
        static let searchBarTopInsets: CGFloat = 96
        static let searchBarHeight: CGFloat = 44
    }
    
    // MARK: - Properties
    
    private var collectionViewDataSource: CollectionViewData = .init()
    
    private lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.searchBarStyle = .minimal
        return bar
    }()
    
    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.register(CollectionContainerViewCell.self, forCellWithReuseIdentifier: CollectionContainerViewCell.id)
        collection.register(SingleItemCollectionViewCell.self, forCellWithReuseIdentifier: SingleItemCollectionViewCell.identifire)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .clear
        return collection
    }()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

private extension MainView {
    
    // MARK: - .addSubviews()
    
    func addSubviews() {
        self.addSubview(searchBar)
        self.addSubview(collection)
    }
    
    // MARK: - .setupConstraints()
    
    func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.searchBarTopInsets)
            make.height.equalTo(Constants.searchBarHeight)
            make.directionalHorizontalEdges.equalToSuperview()
        }
        
        collection.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDelegate

extension MainView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension MainView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return collectionViewDataSource.scrolledCells?.count ?? 0
        case 1:
            return collectionViewDataSource.signleItemsCells?.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionContainerViewCell.id, for: indexPath) as? CollectionContainerViewCell else {
                return UICollectionViewCell()
            }
            
            if let currentCellData = collectionViewDataSource.scrolledCells?[indexPath.row] {
                cell.configure(with: currentCellData)
            }
            
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleItemCollectionViewCell.identifire, for: indexPath) as? SingleItemCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            if let currentCellData = collectionViewDataSource.signleItemsCells?[indexPath.row] {
                cell.configure(with: currentCellData)
            }
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return Constants.firstSectionCollectionItemSize
        default:
            return Constants.mainCollectionViewItemSize
        }
    }
}

// MARK: - ViewModelConfigurable

extension MainView: ViewModelConfigurable {
    struct ViewModel {
        let backgroundColor: UIColor
        var collectionData: CollectionViewData
    }
    
    struct CollectionViewData {
        var scrolledCells: [CollectionContainerViewCell.ViewModel]?
        var signleItemsCells: [SingleItemCollectionViewCell.ViewModel]?
    }
    
    func configure(with viewModel: ViewModel) {
        self.backgroundColor = viewModel.backgroundColor
        collectionViewDataSource = viewModel.collectionData
        
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }
}
