//
//  PieChartViewController.swift
//  Homework18UIBezierPathChart
//
//  Created by 黃柏嘉 on 2021/11/22.
//

import UIKit

class PieChartViewController: UIViewController {
    
    
    @IBOutlet weak var pieBackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let degree = CGFloat.pi/180
        let radius:CGFloat = 100
        var startDegree:CGFloat = 270
        let center = CGPoint(x: pieBackView.bounds.width/2, y: pieBackView.bounds.height/2)
//        var percentages:[CGFloat] = [30,15,55]
//
//        //迴圈製作每個區塊
//        for percentage in percentages {
//            //算出百分比的終點角度
//            let endDegree = startDegree+(360*percentage/100)
//            //繪製區塊
//            let percentagePath = UIBezierPath()
//            percentagePath.move(to: center)
//            percentagePath.addArc(withCenter: center, radius: radius, startAngle: startDegree*degree, endAngle: endDegree*degree, clockwise: true)
//
//            //加入CAShapeLayer()
//            let percentageLayer = CAShapeLayer()
//            percentageLayer.path = percentagePath.cgPath
//            percentageLayer.fillColor =  CGColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
//            pieBackView.layer.addSublayer(percentageLayer)
//            //使下一個起點為上一個終點
//            startDegree = endDegree
//        }
        
        //占比最高的區塊
        var endDegree = startDegree+(360*55/100)
        var percentagePath = UIBezierPath()
            percentagePath.move(to: center)
            percentagePath.addArc(withCenter: center, radius: radius, startAngle: startDegree*degree, endAngle: endDegree*degree, clockwise: true)
        let percentageLayer1 = CAShapeLayer()
            percentageLayer1.path = percentagePath.cgPath
            percentageLayer1.fillColor =  CGColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
            pieBackView.layer.addSublayer(percentageLayer1)

        //第二塊
        startDegree = endDegree
        endDegree = startDegree+(360*30/100)
        percentagePath = UIBezierPath()
        percentagePath.move(to: CGPoint(x: center.x-10, y: center.y))
        percentagePath.addArc(withCenter:CGPoint(x: center.x-10, y: center.y) , radius: radius, startAngle: startDegree*degree, endAngle: endDegree*degree, clockwise: true)

        let percentageLayer2 = CAShapeLayer()
        percentageLayer2.fillColor =  CGColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        percentageLayer2.path = percentagePath.cgPath
        pieBackView.layer.addSublayer(percentageLayer2)

        //第三塊
        startDegree = endDegree
        endDegree = startDegree+(360*15/100)
        percentagePath = UIBezierPath()
        percentagePath.move(to: CGPoint(x: center.x-10, y: center.y))
        percentagePath.addArc(withCenter:CGPoint(x: center.x-10, y: center.y) , radius: radius, startAngle: startDegree*degree, endAngle: endDegree*degree, clockwise: true)

        let percentageLayer3 = CAShapeLayer()
        percentageLayer3.fillColor =  CGColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        percentageLayer3.path = percentagePath.cgPath
        pieBackView.layer.addSublayer(percentageLayer3)

    }
    

    
}
