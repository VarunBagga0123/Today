//
//  TextfieldContentView.swift
//  Today
//
//  Created by Varun Bagga on 09/01/23.
//

import UIKit

class TextFieldContentView : UIView, UIContentView{
    struct Configuration: UIContentConfiguration {
       
        func makeContentView() -> UIView & UIContentView {
            return TextFieldContentView(self)
        }
        
         var text:String? = ""
        
    }

    
    let textField = UITextField()
 
    var configuration : UIContentConfiguration {
        didSet {
            configure(configuration: configuration)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }
    
    init(_ configuration: UIContentConfiguration) {
            self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubView(textField,insets:UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        textField.clearButtonMode = .whileEditing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration:UIContentConfiguration){
        
        guard let configuration = configuration as? Configuration else  {return}
        textField.text = configuration.text
        
    }
}

extension UICollectionViewListCell {
    func textFieldConfiguration()->TextFieldContentView.Configuration{
        TextFieldContentView.Configuration()
    }
}
