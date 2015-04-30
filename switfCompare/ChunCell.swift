//
//  ChunCell.swift
//  switfCompare
//
//  Created by yuhailong on 14-12-11.
//  Copyright (c) 2014年 polystor. All rights reserved.
//

import UIKit

@objc protocol 郑经理Delegate : NSObjectProtocol {
    optional func chunCellButtonClicked(cell:ChunCell, buttonIndex: NSInteger)
}

class ChunCell: UITableViewCell {
    var delegate: protocol<郑经理Delegate>?
    var iv:UIImageView!
    @IBOutlet weak var clickedButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 0 / 255.0, green: 71 / 255.0, blue: 177 / 255.0, alpha: 1).CGColor
    }
    
    
    @IBAction func btnTD(sender: AnyObject) {
        var button = sender as UIButton
        button.backgroundColor = UIColor.redColor()
    }

    @IBAction func btnTU(sender: UIButton) {
        sender.backgroundColor = UIColor.greenColor()
        if(self.delegate != nil && self.delegate?.respondsToSelector(Selector("chunCellButtonClicked: ChunCell : NSInteger")) != nil){
            println(self.delegate?.respondsToSelector(Selector("chunCellButtonClicked:")))
            self.delegate?.chunCellButtonClicked!(self, buttonIndex: sender.tag)
        }
        
    
    }
    

    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
