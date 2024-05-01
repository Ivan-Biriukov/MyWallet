// MARK: - Imports

import UIKit
import SnapKit

// MARK: - FavoritesView

final class FavoritesView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let titleLabelTopInsets: CGFloat = 30
        static let searchBarHorizontalInsets: CGFloat = 25
        static let searchBarTopOffset: CGFloat = 25
        static let tableViewTopOffset: CGFloat = 10
        static let tableViewCellHeightForEptyData: CGFloat = 80
        static let tableViewCellHeightForExistingData: CGFloat = 250
    }
    
    // MARK: - Private properties
    
    private var isSearched: Bool = false
    private var tableViewSearchedData: [SingleItemTableViewCell.ViewModel] = []
    private var tableViewData: [SingleItemTableViewCell.ViewModel] = []
    
    private lazy var titleLabel = TextView()
    
    private lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.searchBarStyle = .minimal
        bar.showsCancelButton = true
        bar.delegate = self
        return bar
    }()
    
    private lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.dataSource = self
        tb.delegate = self
        tb.backgroundColor = .clear
        tb.register(SingleItemTableViewCell.self, forCellReuseIdentifier: SingleItemTableViewCell.identifire)
        tb.register(PlaceholderTableViewCell.self, forCellReuseIdentifier: PlaceholderTableViewCell.identifire)
        return tb
    }()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
        backgroundColor = MWPallete.mainBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

private extension FavoritesView {
    
    // MARK: - .addSubviews()
    
    func addSubviews() {
        [titleLabel, searchBar, tableView].forEach({self.addSubview($0)})
    }
    
    // MARK: - .setupConstraints()
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).inset(Constants.titleLabelTopInsets)
        }
        
        searchBar.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(Constants.searchBarHorizontalInsets)
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.searchBarTopOffset)
        }
        
        tableView.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom).offset(Constants.tableViewTopOffset)
        }
    }
}

// MARK: - UITableView DataSource

extension FavoritesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData.isEmpty {
            return 1
        } else {
            switch isSearched {
            case true:
                return tableViewSearchedData.count
            case false:
                return tableViewData.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableViewData.isEmpty {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PlaceholderTableViewCell.identifire, for: indexPath) as? PlaceholderTableViewCell else {
                return UITableViewCell()
            }

            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SingleItemTableViewCell.identifire, for: indexPath) as? SingleItemTableViewCell else {
                return UITableViewCell()
            }
            
            switch isSearched {
            case true:
                let currentCell = tableViewSearchedData[indexPath.row]
                cell.configure(with: currentCell)
            case false:
                let currentCell = tableViewData[indexPath.row]
                cell.configure(with: currentCell)
            }
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension FavoritesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableViewData.isEmpty {
            return Constants.tableViewCellHeightForEptyData
        } else {
            return Constants.tableViewCellHeightForExistingData
        }
    }
}

// MARK: - UISearchBar Delegate

extension FavoritesView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            tableViewSearchedData = tableViewData.filter({$0.titleLabel.text.lowercased().uppercased().prefix(searchText.count) == searchText.lowercased().uppercased()})
            isSearched = true
        } else {
            isSearched = false
        }
        tableView.reloadSections([0], with: .fade)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        isSearched = false
        tableView.reloadSections([0], with: .fade)
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// MARK: - ViewModelConfigurable

extension FavoritesView: ViewModelConfigurable {
    struct ViewModel {
        let titleLabel: TextView.ViewModel
        var favoritsData: [SingleItemTableViewCell.ViewModel]?
    }
    
    func configure(with viewModel: ViewModel) {
        titleLabel.configure(with: viewModel.titleLabel)
        
        if let favoritsData = viewModel.favoritsData {
            self.tableViewData = favoritsData
            self.tableView.reloadData()
        }
    }
}
