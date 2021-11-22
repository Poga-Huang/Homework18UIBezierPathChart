//
//  Kobe2ImageView.swift
//  Homework18UIBezierPathChart
//
//  Created by 黃柏嘉 on 2021/11/22.
//

import UIKit

class Kobe2ImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 0, y: bounds.height*0.5))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height*0.5))
        path.close()
        
        let kobe2Layer = CAShapeLayer()
        kobe2Layer.path = path.cgPath
        layer.mask = kobe2Layer
    }
}
