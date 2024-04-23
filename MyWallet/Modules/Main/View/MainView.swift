// MARK: - Imports

import UIKit
import SnapKit

// MARK: - MainView

final class MainView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let cardSectionHeight: CGFloat = 250
        static let allTagsSectionHeight: CGFloat = 50
        static let searchBarTopInsets: CGFloat = 96
        static let searchBarHeight: CGFloat = 44
        static let collectionHeaderIdentifire = "Header"
    }
    
    // MARK: - Properties
    
    private var collectionViewDataSource: CollectionViewData = .init()
    
    private lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.searchBarStyle = .minimal
        return bar
    }()
    
    private lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.backgroundColor = .clear
        tb.indicatorStyle = .white
        tb.delegate = self
        tb.dataSource = self
        tb.register(SingleItemTableViewCell.self, forCellReuseIdentifier: SingleItemTableViewCell.identifire)
        tb.register(ImputCollectionTableViewCell.self, forCellReuseIdentifier: ImputCollectionTableViewCell.id)
        return tb
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
        self.addSubview(tableView)
    }
    
    // MARK: - .setupConstraints()
    
    func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.searchBarTopInsets)
            make.height.equalTo(Constants.searchBarHeight)
            make.directionalHorizontalEdges.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func createHeaderView(for viewModel: SetionHeaderViewData) -> UIView {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: viewModel.width, height: viewModel.height))
        
        let label: UILabel = {
            let lb = UILabel()
            lb.font = viewModel.labelFont
            lb.text = viewModel.labelText
            lb.textColor = viewModel.labelTextColor
            lb.textAlignment = viewModel.labelTextAligment
            return lb
        }()
        
        container.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.directionalVerticalEdges.horizontalEdges.equalToSuperview()
        }
        
        return container
    }
}

// MARK: - UITableViewDelegate

extension MainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = collectionViewDataSource.headersForSection?[section] {
            return createHeaderView(for: header)
        } else {
            return nil
        }
    }
}

// MARK: - UITableViewDataSource

extension MainView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return collectionViewDataSource.scrolledCells?.count ?? 0
        case 1:
            return collectionViewDataSource.signleItemsCells?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImputCollectionTableViewCell.id, for: indexPath) as? ImputCollectionTableViewCell else {
                return UITableViewCell()
            }
            
            if let currentCellData = collectionViewDataSource.scrolledCells?[indexPath.row] {
                cell.configure(with: currentCellData)
            }
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SingleItemTableViewCell.identifire, for: indexPath) as? SingleItemTableViewCell else {
                return UITableViewCell()
            }
            
            if let currentCellData = collectionViewDataSource.signleItemsCells?[indexPath.row] {
                cell.configure(with: currentCellData)
            }
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return Constants.allTagsSectionHeight
        default:
            return Constants.cardSectionHeight
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
        var scrolledCells: [ImputCollectionTableViewCell.ViewModel]?
        var signleItemsCells: [SingleItemTableViewCell.ViewModel]?
        var headersForSection: [SetionHeaderViewData]?
    }
    
    struct SetionHeaderViewData {
        let width: CGFloat
        let height: CGFloat
        let labelFont: UIFont
        let labelText: String
        let labelTextColor: UIColor
        let labelTextAligment: NSTextAlignment
    }
    
    func configure(with viewModel: ViewModel) {
        self.backgroundColor = viewModel.backgroundColor
        collectionViewDataSource = viewModel.collectionData
                
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
