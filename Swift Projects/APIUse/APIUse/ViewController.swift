//
//  ViewController.swift
//  APIUse
//
//  Created by admin on 24/03/26.
//
import UIKit

class ViewController:UIViewController {
    var userArr: [Models] = []
    
    override func viewWillAppear(_ animated: Bool) {
        APIManager.shared.callAPI()
    }
}
