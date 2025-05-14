//
//  TodosTableCell.swift
//  Todo List
//
//  Created by Sultan Ali on 13/04/2022.
//

import UIKit

class TodosTableCell: UITableViewCell {

    @IBOutlet var todoCreationDateLabel: UILabel!
    @IBOutlet var todoTitleLabel: UILabel!
    @IBOutlet var todoImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
