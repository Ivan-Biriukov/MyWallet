// MARK: - Imports

import UIKit

// MARK: - SharedCardModel

struct SharedCardModel {
    let name: String
    let category: CardCategory
    var hasAnExpirationDate: Bool
    var frontImage: UIImage?
    var backwardImage: UIImage?
    var isPersonalized: Bool
}

// MARK: - CardCategory

enum CardCategory {
    case groceries
    case technique
    case clothing
    case shoes
    case tobacco
    case pharmacy
    case gas_station
    case entertainment
    case medical_centers
    case alcohol_stores
    case pet_stores
    case veterinary_clinics
    case gift_cards
    case cafes_and_restaurants
    case online_stores
    case coupons
    case hotels_and_inns
    case travel_agencies
    case transporters
    case business_cards
}
