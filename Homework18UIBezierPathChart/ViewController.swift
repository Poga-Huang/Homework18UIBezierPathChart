//
//  ViewController.swift
//  Homework18UIBezierPathChart
//
//  Created by 黃柏嘉 on 2021/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var circleBackView: UIView!
    @IBOutlet weak var percentageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       makeCircularProgressRing(InputPercentage: 0)
        
    }
    
    func makeCircularProgressRing(InputPercentage:CGFloat){
        //預設好參數
        let degree = CGFloat.pi/180
        let lineWidth:CGFloat = 10
        let radius:CGFloat = 100
        let startDegree:CGFloat = 270
        let percentage = InputPercentage
        
        //製作出灰色底作為環狀底部，負責未達進度的部分
        let circlePath = UIBezierPath(ovalIn: CGRect(x: 87, y: 51, width: radius*2, height: radius*2))
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineWidth = lineWidth
        circleLayer.strokeColor = UIColor.gray.cgColor
        
        //進度條部分
        let progressRingPath = UIBezierPath(arcCenter: CGPoint(x: 187, y: 151), radius: radius, startAngle: degree*startDegree, endAngle: degree*(startDegree+360*percentage), clockwise: true)
        let progressRingLayer = CAShapeLayer()
        progressRingLayer.path = progressRingPath.cgPath
        progressRingLayer.fillColor = UIColor.clear.cgColor
        progressRingLayer.lineWidth = lineWidth
        progressRingLayer.strokeColor = UIColor.orange.cgColor
        
        
        circleBackView.layer.addSublayer(circleLayer)
        circleBackView.layer.addSublayer(progressRingLayer)
        let percentageString = percentage*100
        percentageLabel.text = String(format: "%.1f", percentageString) + "%"
    }
    
    //UISlider Action
    @IBAction func changePercentage(_ sender: UISlider) {
        makeCircularProgressRing(InputPercentage: CGFloat(sender.value))
    }
    

}

