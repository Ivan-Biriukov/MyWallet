// MARK: - Imports

import UIKit
import SnapKit

// MARK: - CollectionContainerViewCell

final class CollectionContainerViewCell: UICollectionViewCell {
    
    static let id = "CollectionContainerViewCell"
    
    // MARK: - Properties
    
    private var collectionDataSource: [ButtonCollectionViewCell.ViewModel] = []
    
    private var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 50)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(ButtonCollectionViewCell.self, forCellWithReuseIdentifier: ButtonCollectionViewCell.id)
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

private extension CollectionContainerViewCell {
    func addSubviews() {
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.directionalHorizontalEdges.directionalVerticalEdges.equalToSuperview()
        }
    }
    
    func remakeConstraints(verticalInsets: CGFloat = 0, horizontalInsets: CGFloat = 0) {
        collectionView.snp.updateConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(horizontalInsets)
            make.directionalVerticalEdges.equalToSuperview().inset(verticalInsets)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension CollectionContainerViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell.id, for: indexPath) as? ButtonCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let currentCellData = collectionDataSource[indexPath.row]
        cell.configure(with: currentCellData)
        
        return cell
    }
}

extension CollectionContainerViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell.id, for: indexPath) as? ButtonCollectionViewCell else {
            return
        }
        
        let currentCellData = collectionDataSource[indexPath.row]
        collectionDataSource[indexPath.row].isSelected = !currentCellData.isSelected
        cell.switchSelecting(flag: currentCellData.isSelected)
        collectionView.reloadData()
        print(currentCellData.isSelected)
    }
}

// MARK: - ViewModelConfigurable

extension CollectionContainerViewCell: ViewModelConfigurable {
    
    struct ViewModel {
        let itemSize: CGSize
        let scrollDirection:  UICollectionView.ScrollDirection
        let backgroudColor: UIColor?
        let collectionInsets: CollectionInsets?
        let collectionData: [ButtonCollectionViewCell.ViewModel]
    }
    
    struct CollectionInsets {
        var verticalInsets: CGFloat
        var horizontalInsets: CGFloat
        
        init(
            verticalInsets: CGFloat = 0,
            horizontalInsets: CGFloat = 0
        ) {
            self.verticalInsets = verticalInsets
            self.horizontalInsets = horizontalInsets
        }
    }
    
    func configure(with viewModel: ViewModel) {
        collectionLayout.itemSize = viewModel.itemSize
        collectionLayout.scrollDirection = viewModel.scrollDirection
        collectionDataSource = viewModel.collectionData
        
        if let backgroudColor = viewModel.backgroudColor {
            collectionView.backgroundColor = backgroudColor
        }
        
        if let collectionInsets = viewModel.collectionInsets {
            remakeConstraints(verticalInsets: collectionInsets.verticalInsets, horizontalInsets: collectionInsets.horizontalInsets)
        }
                
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
