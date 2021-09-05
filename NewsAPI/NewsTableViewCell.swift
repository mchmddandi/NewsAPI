//
//  NewsTableViewCell.swift
//  NewsAPI
//
//  Created by Mochamad Dandi on 26/08/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var authorNews: UILabel!
    @IBOutlet weak var descriptionNews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
