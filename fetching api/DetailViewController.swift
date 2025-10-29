//
//  DetailViewController.swift
//  fetching api
//
//  Created by MacBook Pro M1 on 14/10/25.
//

/*import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }*/
    import UIKit

    class DetailViewController: UIViewController {

        @IBOutlet weak var rQuoteLabel: UILabel!
        @IBOutlet weak var rAuthorLabel: UILabel!

        var quoteText: String?
        var authorText: String?

        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Quote Detail"
            view.backgroundColor = .systemBackground

            rQuoteLabel.text = "“\(quoteText ?? "")”"
            rAuthorLabel.text = "- \(authorText ?? "")"
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


