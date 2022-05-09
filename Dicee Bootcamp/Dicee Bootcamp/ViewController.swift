//
//  ViewController.swift
//  Dicee Bootcamp
//
//  Created by Carlos Amaral on 09/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!

    @IBAction func rollButton(_ sender: Any) {
        let n1 : Int = Int.random(in: 1...6)
        let n2 : Int = Int.random(in: 1...6)

        self.dice1.image = UIImage(named: "Dice\(n1)")
        self.dice2.image = UIImage(named: "Dice\(n2)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

