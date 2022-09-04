//
//  UILabelExt.swift
//  pelmorex
//
//  Created by Mert Köksal on 4.09.2022.
//

import UIKit

extension UILabel {
 
    func label(textStr: String = "", textColor: UIColor, textFont: UIFont, lineSpacing: Double, paragraphStyle: NSMutableParagraphStyle) {
        setup(textStr, textColor, textFont, lineSpacing, paragraphStyle)
    }

    func setup(_ textStr: String, _ textColor: UIColor, _ textFont: UIFont, _ lineSpacing: Double, _ paragraphStyle: NSMutableParagraphStyle) {
        let attributedString = NSMutableAttributedString(string: "\(textStr)", attributes: [
            .font: textFont,
            .foregroundColor: textColor,
            .kern: lineSpacing,
            .paragraphStyle: paragraphStyle
        ])
        
        self.attributedText = attributedString
    }
}
