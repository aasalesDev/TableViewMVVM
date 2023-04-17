//
//  TableViewCell.swift
//  TableViewMVVM
//
//  Created by Anderson Sales on 17/04/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var sfSymbolName: UILabel!
    @IBOutlet weak var sfSymbolImage: UIImageView!
    
    static let identifier: String = String(describing: TableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(sfSymbol: SFSymbol) {
        sfSymbolName.text = sfSymbol.name
        sfSymbolImage.image = UIImage(systemName: sfSymbol.name)
    }
}
