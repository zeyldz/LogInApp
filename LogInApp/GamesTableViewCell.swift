//
//  GamesTableViewCell.swift
//  LogInApp
//
//  Created by Zeynep Sude Yıldız on 26.09.2023.
//

import UIKit

class GamesTableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var platform: UILabel!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var url: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var publisher: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        title.adjustsFontSizeToFitWidth = true
        platform.adjustsFontSizeToFitWidth = true
        desc.adjustsFontSizeToFitWidth = true
        url.adjustsFontSizeToFitWidth = true
        publisher.adjustsFontSizeToFitWidth = true
        date.adjustsFontSizeToFitWidth = true
        id.adjustsFontSizeToFitWidth = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
}
