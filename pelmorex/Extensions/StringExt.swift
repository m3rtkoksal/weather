//
//  StringExt.swift
//  pelmorex
//
//  Created by Mert Köksal on 4.09.2022.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
            guard !self.lowercased().hasPrefix("mailto:") else {
                return false
            }
            guard let emailDetector
                = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
                return false
            }
            let matches
                = emailDetector.matches(in: self,
                                        options: NSRegularExpression.MatchingOptions.anchored,
                                        range: NSRange(location: 0, length: self.count))
            guard matches.count == 1 else {
                return false
            }
            return matches[0].url?.scheme == "mailto"
        }
    
    
    var isValidName: Bool {
        let RegEx = "^\\w{4,18}$"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: self)
    }
    
    //validate PhoneNumber
    public func isPhone()->Bool {
        if self.isAllDigits() == true {
            let phoneRegex = "[235689][0-9]{6}([0-9]{3})?"
            let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return  predicate.evaluate(with: self)
        }else {
            return false
        }
    }
    
    private func isAllDigits()->Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = self.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return  self == filtered
    }
    
    func convertCodeToTitle(model: WeatherModel) -> String {
        if model.placecode == "CAON0696" { return "Toronto" }
        else if model.placecode == "CAON0423" { return "Montreal"}
        else if model.placecode == "CAON0512" { return "Ottawa"}
        else if model.placecode == "CABC0308" { return "Vancouver"}
        else { return "Calgary"}
    }
}
