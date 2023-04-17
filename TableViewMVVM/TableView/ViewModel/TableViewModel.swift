//
//  TableViewModel.swift
//  TableViewMVVM
//
//  Created by Anderson Sales on 17/04/23.
//

import Foundation

class TableViewModel {

    private var sfSymbols: [SFSymbol] = []
    
    func setSfSymbol(name: String) {
        self.sfSymbols.append(SFSymbol(name: name))
    }
    
    func getSfSymbol(index: Int) -> SFSymbol {
        return sfSymbols[index]
    }
    
    func removeAll() {
        sfSymbols.removeAll()
    }
    
    var numberOfRowsInSection: Int {
        return sfSymbols.count
    }
    
    var heightForRowAt: CGFloat {
        return 100
    }
}
