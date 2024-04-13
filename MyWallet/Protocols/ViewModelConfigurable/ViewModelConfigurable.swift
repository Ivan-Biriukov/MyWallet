import Foundation

/// Протокол, описывающий cущности, конфигурируемые с помощью ViewModel
protocol ViewModelConfigurable {
    associatedtype ViewModel
    func configure(with viewModel: ViewModel)
}
