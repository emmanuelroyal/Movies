//
//  Helpers.swift
//  Movies
//
//  Created by Decagon on 8/30/21.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        
        get {
            
            return self.cornerRadius
            
        } set {
            
            self.layer.cornerRadius = newValue
        }
        
    }
    
    @IBInspectable var shadowColor: UIColor? {
        
        set {
            
            layer.shadowColor = newValue?.cgColor
            
        }
        get {
            
            guard let color = layer.shadowColor else {
                
                return nil
                
            }
            
            return UIColor(cgColor: color)
            
        }
        
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        
        get {
            
            return self.layer.shadowRadius
            
        } set {
            
            self.layer.shadowRadius = newValue
            
        }
        
    }
    
    @IBInspectable var shadowOpacity: Float {
        
        get {
            
            return self.layer.shadowOpacity
            
        } set {
            
            self.layer.shadowOpacity = newValue
            
        }
        
    }
    
    @IBInspectable var borderWidth: CGFloat {
        
        get {
            
            return self.layer.borderWidth
            
        } set {
            
            self.layer.borderWidth = newValue
            
        }
        
    }
    
    @IBInspectable var borderColor: UIColor? {
        
        set {
            
            layer.borderColor = newValue?.cgColor
            
        }
        get {
            
            guard let color = layer.borderColor else {
                
                return nil
                
            }
            
            return UIColor(cgColor: color)
            
        }
        
    }
    
    private var identifier: String {
        
        return String(describing: self)
        
    }
    
}



extension String {
    
    var asUrl: URL? {
        
        return URL(string: self)
        
    }
    
}

private var kAssociationKeyMaxLength: Int = 0

extension UITextField {
    
    @IBInspectable var maxLength: Int {
        
        get {
            
            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
                
                return length
            } else {
                
                return Int.max
                
            }
            
        }
        set {
            
            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            self.addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
            
        }
        
    }
    
    func isInputMethod() -> Bool {
        
        if let positionRange = self.markedTextRange {
            
            if let _ = self.position(from: positionRange.start, offset: 0) {
                
                return true
                
            }
            
        }
        
        return false
        
    }
    
    
    @objc func checkMaxLength(textField: UITextField) {
        
        guard !self.isInputMethod(), let prospectiveText = self.text,
              prospectiveText.count > maxLength
        else {
            
            return
            
        }
        
        let selection = selectedTextRange
        text = String(prospectiveText.prefix(maxLength))
        selectedTextRange = selection
    }
    
}

extension UITextField{
    
    @IBInspectable var placeHolderColor: UIColor? {
        
        get {
            
            return self.placeHolderColor
            
        }
        
        set {
            
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
            
        }
        
    }
    
}

extension UIViewController {
    
    func showAlert (alertText: String, alertMessage: String) {
        
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Got it", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

extension UIScrollView {
    enum ScrollDirection {
        case up, down, unknown
    }
    
    var scrollDirection: ScrollDirection {
        guard let superview = superview else { return .unknown }
        return panGestureRecognizer.translation(in: superview).y > 0 ? .down : .up
    }
}
