//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Jeiel Lima on 17/08/22.
//

import UIKit

class QuotesViewController: UIViewController {

    
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var ivPhotoBg: UIImageView!
    @IBOutlet weak var lbQuotes: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lcTop: NSLayoutConstraint!
    
    let config = Configuration.shared
    
    let quotesManager = QuotesManager()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
        prepareQuote()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func formatView () {
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68.00/255.0, blue: 15.0/255.0, alpha: 1.0)
        lbQuotes.textColor = config.colorScheme == 0 ? .black : .white
        lbAuthor.textColor = config.colorScheme == 0 ? UIColor(red: 192.0/255.0, green: 96.00/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
        prepareQuote()
    }

    func prepareQuote() {
        timer?.invalidate()
        if config.autoRefresh {
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { (timer) in
                self.showRandomQuote()
            }
        }
        showRandomQuote()
    }
    
    func showRandomQuote() {
        let quote =  quotesManager.getRandomQuotes()
        lbQuotes.text = quote.quote
        lbAuthor.text = quote.author
        ivPhoto.image = UIImage(named: quote.image)
        ivPhotoBg.image = ivPhoto.image
        
        lbQuotes.alpha = 0.0
        lbAuthor.alpha = 0.0
        ivPhoto.alpha = 0.0
        ivPhotoBg.alpha = 0.0
        lcTop.constant = 50
        view.layoutIfNeeded() //usado pra reagrupar as constrains
        
        UIView.animate(withDuration: 2.5) {
            self.lbQuotes.alpha = 1.0
            self.lbAuthor.alpha = 1.0
            self.ivPhoto.alpha = 1.0
            self.ivPhotoBg.alpha = 0.25
            self.lcTop.constant = 10
            self.view.layoutIfNeeded()
        }
    }
}
