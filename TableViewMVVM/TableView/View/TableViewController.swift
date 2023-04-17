//
//  TableViewController.swift
//  TableViewMVVM
//
//  Created by Anderson Sales on 17/04/23.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var sfSymbolTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: TableViewModel = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
        configureTableView()
    }
    
    private func configureTextField() {
        sfSymbolTextField.delegate = self
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
        if isTextFieldEmpty(textField: sfSymbolTextField) {
            //Do Something...
        } else {
            viewModel.setSfSymbol(name: sfSymbolTextField.text ?? "")
            sfSymbolTextField.text = ""
            tableView.reloadData()
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        viewModel.removeAll()
        tableView.reloadData()
    }
    
    private func isTextFieldEmpty(textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            return false
        } else {
            return true
        }
    }
}

extension TableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell {
            cell.configureCell(sfSymbol: viewModel.getSfSymbol(index: indexPath.row))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt 
    }
}
