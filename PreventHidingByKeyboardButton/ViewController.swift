//
//  ViewController.swift
//  PreventHidingByKeyboardButton
//
//  Created by Jeongbae Kong on 2021/10/05.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var avoidKeyboardButton: PreventHidingByKeyboardButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      super.touchesBegan(touches, with: event)
      view.endEditing(true)
  }
}

