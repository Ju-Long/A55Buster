import UIKit

class ContactTableViewCell: UITableViewCell {
    @IBOutlet weak var outName: UILabel!
    @IBOutlet weak var outContact: UILabel!
    @IBOutlet weak var outAddress: UILabel!
    @IBOutlet weak var outPostalCode: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
