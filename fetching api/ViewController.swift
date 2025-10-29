//
//  ViewController.swift
//  fetching api
//
//  Created by iCodeWave Community on 07/10/25.
//

import UIKit
import Alamofire
import SwiftyJSON

/*class ViewController: UIViewController {
    let networking = Networking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networking.ambilData { quotes in
            for q in quotes {
                print("\(q.id). \(q.quote) — \(q.author)")
            }
        }
    }
}
   */

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    private var quotes: [Quote] = []
    private let networking = Networking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Quotes"
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        
        ambilDataDariAPI()
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let destinationVC = segue.destination as? DetailViewController,
               let indexPath = tableView.indexPathForSelectedRow {
                let selectedQuote = quotes[indexPath.row]
                destinationVC.quoteText = selectedQuote.quote
                destinationVC.authorText = selectedQuote.author
            }
        }
    }
    
    
    private func ambilDataDariAPI() {
        Networking.shared.ambilData { [weak self] (hasil: [Quote]) in
            DispatchQueue.main.async { //serial Async
                self?.quotes = hasil
                self?.tableView.reloadData()
            }
        }
    }
    
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath) as? QuoteCellTableViewCell else {
            return UITableViewCell()
        }

        let data = quotes[indexPath.row]
        cell.quoteLabel.text = "“\(data.quote)”"
        cell.authorLabel.text = "- \(data.author)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: self)
    }
}



