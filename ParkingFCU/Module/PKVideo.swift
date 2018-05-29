//
//  PKvideo.swift
//  ParkingFCU
//
//  Created by MCLAB on 2018/5/21.
//  Copyright © 2018年 MCLAB. All rights reserved.
//

import Foundation
import UIKit

class PKVideo {
    
    public var Video_Container : [ (UIImage) ] = []
    
    /***
        Input  :
        Output : The number of Videos to show
    ***/
    func numberOfVideo() -> Int{
        return (3)
    }
    
    /***
        Input  :    顯示在View上的原點以及SIZE大小
        Output :    回傳一個ScrollView, 有基本設定, 橫軸依照不同影像增加橫軸
     ***/
    func initFrame(point: CGPoint, size: CGSize) -> UIScrollView {
        
        let rect = CGRect.init(x: point.x, y: point.y, width: size.width , height: size.height)
        var PKvideoView : UIScrollView = UIScrollView.init(frame: rect)
        PKvideoView.contentSize = CGSize( width: CGFloat(Int(size.width) * numberOfVideo()), height: size.height)
        PKvideoView.showsHorizontalScrollIndicator = true
        PKvideoView.showsVerticalScrollIndicator = false
        PKvideoView.indicatorStyle = .black
        PKvideoView.isScrollEnabled = true
        PKvideoView.scrollsToTop = false
        PKvideoView.isDirectionalLockEnabled = false
        PKvideoView.bounces = true
        PKvideoView.zoomScale = 1.0
        
        return PKvideoView
    }
    
    /***
     Input  :
     Output : The number of Videos to show
     ***/
    func VideoInit() {
        
    }

}
