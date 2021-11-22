//
//  DonutChartViewController.swift
//  Homework18UIBezierPathChart
//
//  Created by 黃柏嘉 on 2021/11/22.
//

import UIKit

class DonutChartViewController: UIViewController {

    
    @IBOutlet weak var donutBackView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //預設甜甜圈圖表(大小，中心點，百分比)
        let degree = CGFloat.pi/180
        let lineWidth:CGFloat = 80
        let radius:CGFloat = 100
        var startDegree:CGFloat = 270
        let center = CGPoint(x: donutBackView.bounds.width/2, y: donutBackView.bounds.height/2)
        var percentages:[CGFloat] = [25,25,25,25]
        
        //迴圈製作每個區塊
        for percentage in percentages {
            //算出百分比的終點角度
            let endDegree = startDegree+(360*percentage/100)
            //繪製區塊
            let percentagePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: degree*startDegree, endAngle: degree*endDegree, clockwise: true)
            
            //加入CAShapeLayer()
            let percentageLayer = CAShapeLayer()
            percentageLayer.path = percentagePath.cgPath
            percentageLayer.fillColor = UIColor.clear.cgColor
            percentageLayer.lineWidth = lineWidth
            //顏色隨機
            percentageLayer.strokeColor = CGColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
            donutBackView.layer.addSublayer(percentageLayer)
            
            //加入Label
            func createLabel(percentage:CGFloat,startDegree:CGFloat)->UILabel{
                //中心點為每個圓弧區塊的中間
                let textCenter = startDegree+(360*percentage/2/100)
                //繪製出文字所在區域
                let textPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: degree*textCenter, endAngle: degree*textCenter, clockwise: true)
                //生成Label
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
                label.font = UIFont.systemFont(ofSize: 15)
                label.text = "\(percentage)%"
                label.backgroundColor = UIColor.white
                label.sizeToFit()
                //Label中心點為繪製的文字所在區域
                label.center = textPath.currentPoint
                
                return label
            }
            //使用回傳一個UILabel的方法加入到畫面
            donutBackView.addSubview(createLabel(percentage: percentage, startDegree: startDegree))
            
            //使下一個起點為上一個終點
            startDegree = endDegree
        }
        

        
       
    }
  
   
    
    

   
}
