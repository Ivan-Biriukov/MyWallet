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
    var isFavorite: Bool
}

// MARK: - CardCategory

enum CardCategory: String, CaseIterable {
    case groceries = "Groceries"
    case technique = "Technique"
    case clothing = "Clothing"
    case shoes = "Shoes"
    case tobacco = "Tobacco"
    case pharmacy = "Pharmacy"
    case gas_station = "Gas Station"
    case entertainment = "Entertainment"
    case medical_centers = "Medical Centers"
    case alcohol_stores = "Alcohol Stores"
    case pet_stores = "Pet Stores"
    case veterinary_clinics = "Veterinary Clinics"
    case gift_cards = "Gift Cards"
    case cafes_and_restaurants = "Cafes && Restaurants"
    case online_stores = "Online Stores"
    case coupons = "Coupons"
    case hotels_and_inns = "Hotels && inns"
    case travel_agencies = "Travel Agencies"
    case transporters = "Transporters"
    case business_cards = "Business Cards"
}
