//
//  DetailViewController.swift
//  GoodReads
//
//  Created by User on 13/08/2019.
//  Copyright © 2019 Timur LLC. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    var card: Card?
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let card = card else { return }
        nameLabel.text = card.name
        typeLabel.text = card.type
        descriptionLabel.text = card.oracle
        if let url = URL(string: card.imageUris!.large!) {
            cardImage.kf.setImage(with: url)
        }
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
