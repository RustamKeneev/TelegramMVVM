//
//  BaseCell.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 6/27/21.
//

import Foundation
import UIKit

class BaseCell: UITableViewCell {
    
    var isLoaded = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        if !isLoaded{
            isLoaded = true
            
            addSubviews()
            setupUI()
            onViewLoaded()
        }
    }
    
    open func addSubviews(){
        
    }
    
    open func setupUI(){
        
    }
    
    open func onViewLoaded(){
        
    }
    
}
