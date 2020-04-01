//
//  DetailViewController.swift
//  Eindopdracht-IOS
//
//  Created by Stefan Willems on 26/03/2020.
//  Copyright © 2020 Stefan Willems. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.name
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: Pokemon? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

