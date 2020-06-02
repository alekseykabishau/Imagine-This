//
//  UIView+Ext.swift
//  Imagine This
//
//  Created by Aleksey on 0601..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

extension UIView {
	
	func fillSuperview(padding: UIEdgeInsets = .zero) {
		translatesAutoresizingMaskIntoConstraints = false
		if let superviewTopAnchor = superview?.topAnchor {
			topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
		}
		
		if let superviewBottomAnchor = superview?.bottomAnchor {
			bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
		}
		
		if let superviewLeadingAnchor = superview?.leadingAnchor {
			leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
		}
		
		if let superviewTrailingAnchor = superview?.trailingAnchor {
			trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
		}
	}
	
	
	func centerInSuperview(size: CGSize = .zero) {
		translatesAutoresizingMaskIntoConstraints = false
		if let superviewCenterXAnchor = superview?.centerXAnchor {
			centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
		}
		
		if let superviewCenterYAnchor = superview?.centerYAnchor {
			centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
		}
		
		if size.width != 0 {
			widthAnchor.constraint(equalToConstant: size.width).isActive = true
		}
		
		if size.height != 0 {
			heightAnchor.constraint(equalToConstant: size.height).isActive = true
		}
	}
}
