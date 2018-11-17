//
//  QuizCell.swift
//  iQuiz
//
//  Created by iguest on 10/29/18.
//  Copyright © 2018 stonek9. All rights reserved.
//

import UIKit

class QuizCell: UITableViewCell {

    @IBOutlet weak var imgQuiz: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
