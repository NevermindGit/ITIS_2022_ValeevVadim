import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    private let footwearList = Database.getAllFootwear()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return footwearList.brandsList.count
        }
        return footwearList.footwearList.count
    }
    
    enum CellIdentifier: String {
        case brands
        case footwear
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var cell: UITableViewCell = .init()
            var config = UIListContentConfiguration.valueCell()
            let brand = footwearList.brandsList[indexPath.row]
            
            if let deqCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.brands.rawValue) {
                cell = deqCell
            } else {
                cell = UITableViewCell(style: .default, reuseIdentifier: CellIdentifier.footwear.rawValue)
            }
            if brand.name == "Nike" || brand.name == "Jordan" || brand.name == "Adidas" {
                config.secondaryText = "✔"
            }
            config.text = brand.name
            config.image = UIImage(named: brand.image)
            config.imageProperties.maximumSize = CGSize(width: 30, height: 30)
            cell.contentConfiguration = config
            cell.selectionStyle = .none
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.footwear.rawValue, for: indexPath) as? FootwearTableViewCell else {
            fatalError("Error")
        }
        let footwear = footwearList.footwearList[indexPath.row]
        cell.set(footwear: footwear)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Footwear Brands"
        }
        return "Footwear List"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) as? FootwearTableViewCell {
            cell.didSelect(footwear: footwearList.footwearList[indexPath.row], at: indexPath)
        }
    }
    
    private func setup() {
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier.brands.rawValue)
        tableView.register(FootwearTableViewCell.self, forCellReuseIdentifier: CellIdentifier.footwear.rawValue)
        
    }
    
}
