//
//  ViewController.swift
//  TableViewMVVM
//
//  Created by Anderson Sales on 17/04/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let vc = UIStoryboard(name: String(describing: TableViewController.self), bundle: nil).instantiateViewController(identifier: String(describing: TableViewController.self)) as? TableViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

