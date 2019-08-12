//
//  ViewController.swift
//  GoodReads
//
//  Created by User on 15/07/2019.
//  Copyright © 2019 Timur LLC. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    var cards: [Card] = []
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.fetchCard()
    }
    
    func fetchCard() {
        let stringURL = "https://api.scryfall.com/cards/"
        guard let url = URL(string: stringURL) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(error?.localizedDescription ?? "dataTask error")
                return
            }
            guard let data = data else { return }
            guard let cardsResponse = try? JSONDecoder().decode(CardsResponse.self, from: data) else {
                print("JSON parse error")
                return
            }
            self.cards = cardsResponse.cards
            print(cardsResponse.cards.count)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Data Sourse
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            let currentCard = cards[indexPath.row]
            cell.nameLabel.text = currentCard.name
            guard let url = URL(string: currentCard.imageUris!.small!) else { return cell }
            cell.cardImage.kf.setImage(with: url)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}
