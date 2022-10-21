import UIKit

class FootwearTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private let brandLabel: UILabel = .init()
    private let modelLabel: UILabel = .init()
    private let sizeLabel: UILabel = .init()
    private let footwearTypeLabel: UILabel = .init()
    
    
    private func setup() {
        brandLabel.font = .boldSystemFont(ofSize: 15)
        modelLabel.font = .boldSystemFont(ofSize: 15)
        sizeLabel.font = .boldSystemFont(ofSize: 15)
        footwearTypeLabel.font = .boldSystemFont(ofSize: 15)
        brandLabel.adjustsFontSizeToFitWidth = true
        modelLabel.adjustsFontSizeToFitWidth = true
        let stackView = UIStackView(arrangedSubviews: [
            brandLabel, modelLabel, sizeLabel, footwearTypeLabel
        ])
        stackView.axis = .vertical
        stackView.alignment = .leading
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
    func set(footwear: Footwear) {
        brandLabel.text = footwear.brand
        modelLabel.text = footwear.model
        sizeLabel.text = String(footwear.size)
        footwearTypeLabel.text = footwear.footwearType.rawValue
    }

    func didSelect(footwear: Footwear, at indexPath: IndexPath) {
        print("Footwear: \(footwear.brand) \(footwear.model) (\(footwear.size))")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
