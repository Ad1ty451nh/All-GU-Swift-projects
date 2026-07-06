//
//  ViewController.swift
//  spanishAPI
//
//  Created by admin on 25/03/26.
//

import UIKit

class ViewController: UIViewController {
    var userArr: [Model] = []

    override func viewWillAppear(_ animated: Bool) {
        APIManager.shared.callAPI()
    }
}

