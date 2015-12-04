//
//  ViewController.swift
//  SimpleLayer
//
//  Created by wubing on 15/11/26.
//  Copyright © 2015年 bing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var layerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        /* 用bundle中的jpg创建UIImage对象 */
        let image = UIImage(named: "snowboy.jpg")
        /* layer.contents 即【寄宿图】 */
        layerView.layer.contents = image?.CGImage
        /* contentsGravity对应UIView的contentMode；对contentMode的操作，实际上是对layer层的 contentsGravity操作*/
        layerView.layer.contentsGravity = kCAGravityCenter
        /* 寄宿图的像素尺寸和视图大小的比例 */
        layerView.layer.contentsScale = UIScreen.mainScreen().scale
        /* 设置是否显示边界之外的内容 */
        layerView.layer.masksToBounds = true
        /* 可以按照比例截取显示图片一部分 可做拼合图片来用 */
        layerView.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5)
        /* 可拉伸边框 */
        layerView.layer.contentsCenter = CGRectMake(0.25, 0.25, 0.25, 0.25)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

