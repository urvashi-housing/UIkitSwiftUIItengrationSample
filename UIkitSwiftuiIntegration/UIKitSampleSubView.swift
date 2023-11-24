//
//  UIKitSampleSubView.swift
//  UIkitSwiftuiIntegration
//
//  Created by Urvashi Gupta on 21/11/23.
//

import Foundation
import UIKit

protocol UIKitSampleSubViewDelegate {
    func didChangeToggleValue(isOn:Bool)
}
class UIKitSampleSubView: UIView{
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var darkModeToggle: UISwitch!
    var delegate : UIKitSampleSubViewDelegate?
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        loadViewFromNib()
     }
    @IBAction func valueChanged(_ sender: UISwitch) {
        delegate?.didChangeToggleValue(isOn: sender.isOn)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadViewFromNib()
        fatalError("init(coder:) has not been implemented")
    }

    
    func loadViewFromNib()  {
        Bundle.main.loadNibNamed("UIKitSampleSubView", owner: self,options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
    }
   
}
