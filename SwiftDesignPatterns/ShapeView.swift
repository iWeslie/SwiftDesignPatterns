//
//  ShapeView.swift
//  SwiftDesignPatterns
//
//  Created by Weslie on 2018/12/19.
//  Copyright © 2018 Weslie. All rights reserved.
//

import UIKit

class ShapeView: UIView {

	var shape: Shape!
	
	var showFill: Bool = true {
		didSet {
			setNeedsDisplay()
		}
	}
	var fillColor: UIColor = UIColor.orange {
		didSet {
			setNeedsDisplay()
		}
	}
	
	var showOutline: Bool = true {
		didSet {
			setNeedsDisplay()
		}
	}
	var outlineColor: UIColor = UIColor.gray {
		didSet {
			setNeedsDisplay()
		}
	}
	
	var tapHandler: ((ShapeView) -> ())?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
		addGestureRecognizer(tapRecognizer)
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func handleTap() {
		tapHandler?(self)
	}
	
	let halfLineWidth: CGFloat = 3.0
}

class SquareShapeView: ShapeView {
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		
		if showFill {
			fillColor.setFill()
			let fillPath = UIBezierPath(rect: bounds)
			fillPath.fill()
		}
		
		if showOutline {
			outlineColor.setStroke()
			let outlinePath = UIBezierPath(rect: CGRect(x: halfLineWidth, y: halfLineWidth, width: bounds.size.width - 2 * halfLineWidth, height: bounds.size.height - 2 * halfLineWidth))
			outlinePath.lineWidth = 2.0 * halfLineWidth
			outlinePath.stroke()
		}
	}

}
