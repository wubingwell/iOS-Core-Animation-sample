//
//  ViewController.swift
//  SimpleLayer
//
//  Created by iOS developer on 15/11/26.
//  Copyright © 2015年 bing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var layerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let blueLayer: CALayer = CALayer.init()
        blueLayer.frame = CGRect(x: 50.0, y: 50.0, width: 100.0, height: 100.0)
        blueLayer.backgroundColor = UIColor.blueColor().CGColor
        layerView.layer.addSublayer(blueLayer)
        
        /* 设置layer的delegate contentScale*/
        blueLayer.delegate = self
        blueLayer.contentsScale = UIScreen.mainScreen().scale
        
        /* 强制重新渲染layer calayer不自动重绘*/
        blueLayer.display()
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
//    /* 可以在这里，直接设置layer的contents，使其显示一张图片 */
//    override func displayLayer(layer: CALayer) {
//        layer.contents =  UIImage().scale
//    }
    /* 如果没有实现displayLayer 则会调用该方法 CALayer创建空的寄宿图
     * 和Core Graphics的绘制上下文环境，为绘制寄宿图做准备
     * UIView封装了CALayer且作为其delegate UIView的CALayer的contents默认空。实现了UIView
     * 的drawRect，则分配了一个寄宿图。因此不要实现空的drawRect。耗费性能和资源
     */
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        CGContextSetLineWidth(ctx, 10.0)
        CGContextSetStrokeColorWithColor(ctx, UIColor.redColor().CGColor)
        CGContextStrokeEllipseInRect(ctx, layer.bounds)
    }
}

