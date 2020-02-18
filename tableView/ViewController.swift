

import UIKit

class ViewController: UIViewController {
    
    var cities = ["Canberra", "Baku", "Minsk", "Brussels", "Sofia", "Zagreb", "Nicosia", "Paris", "Dublin", "Rome", "Jakarta", "Riga", "Vilnius", "Wellington", "Doha", "Kyiv", "Budapest", "Tbilisi", "Athens", "Moscow"]
    
    let countOfCityInSection: Int = 5
    
    let colorTitles: [String] = ["Green", "Red", "Yellow", "Cyan"]
    @IBOutlet weak var tableView: UITableView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return colorTitles[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesCell", for: indexPath)
        cell.textLabel?.text = cities[countOfCityInSection * indexPath.section + indexPath.row]
        if indexPath.section == 0 {
            cell.backgroundColor = UIColor.green
        } else if indexPath.section == 1 {
            cell.backgroundColor = UIColor.red
        } else if indexPath.section == 2 {
            cell.backgroundColor = UIColor.yellow
        } else if indexPath.section == 3 {
            cell.backgroundColor = UIColor.cyan
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 5 {
            return 60.0
        } else {
            return 40.0
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        cities.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .none)
    }
}
