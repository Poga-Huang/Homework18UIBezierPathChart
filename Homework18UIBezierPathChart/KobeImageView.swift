//
//  KobeImageView.swift
//  Homework18UIBezierPathChart
//
//  Created by 黃柏嘉 on 2021/11/22.
//

import UIKit

class KobeImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: bounds.width, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: 0, y: bounds.height*0.5))
        path.close()
        
        let kobeLayer = CAShapeLayer()
        kobeLayer.path = path.cgPath
        layer.mask = kobeLayer
    }
}
