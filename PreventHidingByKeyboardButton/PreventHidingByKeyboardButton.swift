//
//  PreventHidingByKeyboardButton.swift
//  PreventHidingByKeyboardButton
//
//  Created by Jeongbae Kong on 2021/10/05.
//

import UIKit

class PreventHidingByKeyboardButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addKeyboardNotification()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    addKeyboardNotification()
  }
  
  private func addKeyboardNotification() {
      NotificationCenter.default.addObserver(
        self,
        selector: #selector(keyboardWillShow),
        name: UIResponder.keyboardWillShowNotification,
        object: nil
      )
      
      NotificationCenter.default.addObserver(
        self,
        selector: #selector(keyboardWillHide),
        name: UIResponder.keyboardWillHideNotification,
        object: nil
      )
    }
  
  @objc private func keyboardWillShow(_ notification: Notification) {
    if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
      let keybaordRectangle = keyboardFrame.cgRectValue
      let keyboardHeight = keybaordRectangle.height
      self.frame.origin.y -= keyboardHeight
    }
  }
    
  @objc private func keyboardWillHide(_ notification: Notification) {
    if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
      let keybaordRectangle = keyboardFrame.cgRectValue
      let keyboardHeight = keybaordRectangle.height
      self.frame.origin.y += keyboardHeight
    }
  }
  
}
