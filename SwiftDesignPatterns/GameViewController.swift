//
//  GameViewController.swift
//  SwiftDesignPatterns
//
//  Created by Weslie on 2018/12/19.
//  Copyright © 2018 Weslie. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
        // 1
		beginNextTurn()
	}
	
	override var prefersStatusBarHidden: Bool {
		return true
	}
	
	private func beginNextTurn() {
        // 2
		let shape1 = SquareShape()
		shape1.sideLength = Utils.randomBetweenLower(lower: 0.3, andUpper: 0.8)
		let shape2 = SquareShape()
		shape2.sideLength = Utils.randomBetweenLower(lower: 0.3, andUpper: 0.8)
		
        // 3
		let availSize = gameView.sizeAvailableForShapes()
        
        // 4
		let shapeView1: ShapeView = SquareShapeView(frame: CGRect(x: 0, y: 0, width: availSize.width * shape1.sideLength, height: availSize.height * shape1.sideLength))
		shapeView1.shape = shape1
		let shapeView2: ShapeView = SquareShapeView(frame: CGRect(x: 0, y: 0, width: availSize.width * shape2.sideLength, height: availSize.height * shape2.sideLength))
		shapeView2.shape = shape2
        
        // 5
		let shapeViews = (shapeView1, shapeView2)
		
        // 6
		shapeViews.0.tapHandler = {
			tappedView in
			self.gameView.score += shape1.sideLength >= shape2.sideLength ? 1 : -1
			self.beginNextTurn()
		}
		shapeViews.1.tapHandler = {
			tappedView in
			self.gameView.score += shape2.sideLength >= shape1.sideLength ? 1 : -1
			self.beginNextTurn()
		}
		
        // 7
		gameView.addShapeViews(newShapeViews: shapeViews)
	}
	
	private var gameView: GameView { return view as! GameView }

}
