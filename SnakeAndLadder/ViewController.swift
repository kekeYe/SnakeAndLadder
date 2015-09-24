//
//  ViewController.swift
//  SnakeAndLadder
//
//  Created by Daniel on 15/9/23.
//  Copyright © 2015年 Daniel. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var custom : CGFloat = 0
    var buttonAc = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonAc = UIButton(type: UIButtonType.System)
        buttonAc.frame = CGRectMake(20, 370, 30, 30)
        buttonAc.backgroundColor = UIColor.redColor()
        buttonAc.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonAc)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func randomIn(min: Int, max: Int) -> Int {
        return Int(arc4random()) % (max - min + 1) + min
    }
    
    /**
    点击红色按钮 才有效果
    
    */
    func buttonClicked(sender:UIButton){
        
        
        if(self.custom >= 25){
            self.custom = 25
            let  hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.labelText = "游戏已经结束了"
            hud.hide(true, afterDelay: 1)
            return
        }
        
        let pos1: Int = Int(arc4random_uniform(UInt32(6)))
        let aa = CGFloat(pos1+1)
        print("🎲骰了 \(aa)点", terminator: "")
        

        let  hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.labelText = "🎲骰了 \(aa)点"
        hud.hide(true, afterDelay: 1)
        
        
        self.custom = self.custom + aa
        let result = changeValueForSnake(self.custom)
        
        print("现在前进到\(result)位置", terminator: "")
        
        self.custom = result;
        if (self.custom >= 25){
            print("成功完成游戏", terminator: "")

        }
        
        UIView.animateWithDuration(1) { () -> Void in
            self.buttonAc.center = self.getFrameWithNumber(self.custom)
        }
        
//        repeat{
//            
//         print(self.getFrameWithNumber(self.custom))
//         self.custom = self.custom + 1
//        }while self.custom <= 25
//        
    }

    /**
    逻辑判断
    
    - parameter key: 当前点数
    
    - returns: 坐标中心点
    */
    func getFrameWithNumber(key: CGFloat) -> CGPoint{
        var tempRec:CGPoint = CGPointMake(0, 0)
        
        let tmpi:Int = Int((key-1)/5)
        let key  = Int (key)
        if ( (tmpi%2) == 0){
            
            tempRec = CGPointMake(CGFloat((key-1)%5 + 1), CGFloat((key-1)/5 + 1))
            
        }else{
            
            tempRec = CGPointMake(CGFloat(5 - ((key-1)%5)), CGFloat( 1 + (key-1)/5))
        }
        
        let result :CGPoint = CGPointMake(33 + 64 * (tempRec.x - 1), 449 - 64 * tempRec.y)
        
        return result
    }
    
    /**
    表示 梯子和蛇的效果
    
    - parameter key: 当前点
    
    - returns: 特殊效果处理后的点
    */
    func changeValueForSnake(key: CGFloat) -> CGFloat{
        var result:CGFloat = 0
        if(self.custom >= 25){
            result = 25
        }else{
            result = key
        }
        switch key{
        case 3:
            return 11
        case 10:
            return 12
        case 9:
            return 18
        case 6:
            return 17
            //
        case 14:
            return 4
        case 19:
            return 8
        case 22:
            return 20
        case 24:
            return 16
        default:
            return result
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

