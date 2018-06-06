//
//  MonitorViewController.swift
//  ParkingFCU
//
//  Created by MCLAB on 2018/5/21.
//  Copyright © 2018年 MCLAB. All rights reserved.
//

import UIKit
import Charts
import WebKit

class MonitorViewController: UIViewController , ChartViewDelegate{
    
    @IBOutlet weak var ui_camera: UIView!
    @IBOutlet weak var chartView: LineChartView!
    
    @IBAction func btn_goRight(_ sender: Any) {
        print("webPage : \(webPage), count: \(webViewArr.count)")
        if webPage < webViewArr.count{
            webViewArr[webPage-1].alpha = 0
            webViewArr[webPage].alpha = 1
            webPage += 1

        }else{
            
        }
    }
    @IBAction func btn_goLeft(_ sender: Any) {
        print("webPage : \(webPage), count: \(webViewArr.count)")

        if webPage > 1{
            webPage -= 1
            webViewArr[webPage].alpha = 0
            webViewArr[webPage-1].alpha = 1
            
        }else{
            
        }

    }
    
    var webViewArr : [WKWebView] = [WKWebView]()
    var webPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initWebCamera( WebSite: "https://www.yahoo.com")
        initWebCamera( WebSite: "https://www.github.com")
        initWebCamera( WebSite: "https://www.google.com")

//        self.options = [.toggleValues,
//                        .toggleFilled,
//                        .toggleCircles,
//                        .toggleCubic,
//                        .toggleHorizontalCubic,
//                        .toggleStepped,
//                        .toggleHighlight,
//                        .animateX,
//                        .animateY,
//                        .animateXY,
//                        .saveToGallery,
//                        .togglePinchZoom,
//                        .toggleAutoScaleMinMax,
//                        .toggleData]
//
        
        chartView.delegate = self
        
        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        
        let l = chartView.legend
        l.form = .line
        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
        l.textColor = .black
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        
        let xAxis = chartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 11)
        xAxis.labelTextColor = .red
        xAxis.drawAxisLineEnabled = false
        
        let leftAxis = chartView.leftAxis
        leftAxis.labelTextColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
        leftAxis.axisMaximum = 100
        leftAxis.axisMinimum = 0
        leftAxis.drawGridLinesEnabled = true
        leftAxis.granularityEnabled = true
        
        let rightAxis = chartView.rightAxis
        rightAxis.labelTextColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
        rightAxis.axisMaximum = 100
        rightAxis.axisMinimum = 0
        rightAxis.granularityEnabled = false
        
//        sliderX.value = 20
//        sliderY.value = 30
//        slidersValueChanged(nil)
        self.setDataCount(Int(15), range: UInt32(50))

        chartView.animate(xAxisDuration: 2.5)

        // Do any additional setup after loading the view.
    }
//    override func updateChartData() {
//        if self.shouldHideData {
//            chartView.data = nil
//            return
//        }
//
//        self.setDataCount(Int(sliderX.value + 1), range: UInt32(sliderY.value))
//    }
    
    func setDataCount(_ count: Int, range: UInt32) {
        let yVals1 = (0..<count).map { (i) -> ChartDataEntry in
            let mult = range / 2
            let val = Double(arc4random_uniform(mult) + 50)
            return ChartDataEntry(x: Double(i), y: val)
        }
        let yVals2 = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(range) + 30)
            return ChartDataEntry(x: Double(i), y: val)
        }
        let yVals3 = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(range) + 10)
            return ChartDataEntry(x: Double(i), y: val)
        }
        
        let set1 = LineChartDataSet(values: yVals1, label: "DataSet 1")
        set1.axisDependency = .left
        set1.setColor(UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1))
        set1.setCircleColor(.white)
        set1.lineWidth = 2
        set1.circleRadius = 3
        set1.fillAlpha = 65/255
        set1.fillColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
        set1.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        set1.drawCircleHoleEnabled = false
        set1.drawFilledEnabled = true
        set1.mode = .cubicBezier
        
        let set2 = LineChartDataSet(values: yVals2, label: "DataSet 2")
        set2.axisDependency = .right
        set2.setColor(.red)
        set2.setCircleColor(.white)
        set2.lineWidth = 2
        set2.circleRadius = 3
        set2.fillAlpha = 65/255
        set2.fillColor = .red
        set2.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        set2.drawCircleHoleEnabled = false
        set2.drawFilledEnabled = true
        set2.mode = .cubicBezier

        let set3 = LineChartDataSet(values: yVals3, label: "DataSet 3")
        set3.axisDependency = .right
        set3.setColor(.yellow)
        set3.setCircleColor(.white)
        set3.lineWidth = 2
        set3.circleRadius = 3
        set3.fillAlpha = 65/255
        set3.fillColor = UIColor.yellow.withAlphaComponent(200/255)
        set3.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        set3.drawCircleHoleEnabled = false
        set3.drawFilledEnabled = true
        set3.mode = .cubicBezier

        let data = LineChartData(dataSets: [set1, set2, set3])
        data.setValueTextColor(.black)
        data.setValueFont(.systemFont(ofSize: 6))
        
        chartView.data = data
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initWebCamera( WebSite: String){
        let deSize : CGFloat = 0
        let point = CGPoint.init(x: deSize/2, y: 0)
        let size = CGSize.init(width: (ui_camera.frame.width - deSize), height: ui_camera.frame.height)
        let frame = CGRect(origin: point , size: size)
        var webView = WKWebView.init(frame: frame)
//        let url = URL(string: "http://140.134.25.44:8081")
        let url = URL(string: WebSite)
        let request = NSURLRequest(url: url!)
        webView.scrollView.isScrollEnabled = false
        webView.load(request as URLRequest)
        if webViewArr.count == 0 {
            webView.alpha = 1
            webPage = 1
        }else{
            webView.alpha = 0
        }
        ui_camera.addSubview(webView)
        webViewArr.append(webView)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
