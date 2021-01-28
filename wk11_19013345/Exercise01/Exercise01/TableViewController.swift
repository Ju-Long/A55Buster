import UIKit

class TableViewController: UITableViewController {
    
    var personArray = [Person(firstName: "John", lastName: "Tan"),Person(firstName: "Jenny", lastName: "Lee")]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
      -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let row = indexPath.row
        if let label = cell.textLabel {
            label.text = "\(personArray[row].firstName)"
        }
        if let label = cell.detailTextLabel{
            label.text = "\(personArray[row].lastName)"
        }
        return cell
    }
}
