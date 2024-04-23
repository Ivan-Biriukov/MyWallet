// MARK: - Imports

import UIKit
import SnapKit

// MARK: - ImputCollectionTableViewCell

final class ImputCollectionTableViewCell: UITableViewCell {
    
    static let id = "ImputCollectionTableViewCell"
    
    // MARK: - Constants
    private enum Constants {
        static let hieghtForItemLayout: CGFloat = 30
    }
    
    // MARK: - Properties
    
    private var collectionDataSource: [ButtonCollectionViewCell.ViewModel] = []
    
    private var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.register(ButtonCollectionViewCell.self, forCellWithReuseIdentifier: ButtonCollectionViewCell.id)
        collection.indicatorStyle = .white
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

private extension ImputCollectionTableViewCell {
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
    
    func configure() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
    }
}

// MARK: - UICollectionViewDataSource

extension ImputCollectionTableViewCell: UICollectionViewDataSource {
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

// MARK: - UICollectionViewDelegate

extension ImputCollectionTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell.id, for: indexPath) as? ButtonCollectionViewCell else {
            return
        }
        
        let currentCellData = collectionDataSource[indexPath.row]
        collectionDataSource[indexPath.row].isSelected = !currentCellData.isSelected
        cell.switchSelecting(flag: currentCellData.isSelected)
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ImputCollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let currentElement = collectionDataSource[indexPath.row]
        
        return CGSize(width: SizeCalculatorHelper.calculateWidthForText(currentElement.title, font: currentElement.font), height: Constants.hieghtForItemLayout)
    }
}

// MARK: - ViewModelConfigurable

extension ImputCollectionTableViewCell: ViewModelConfigurable {
    
    struct ViewModel {
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
