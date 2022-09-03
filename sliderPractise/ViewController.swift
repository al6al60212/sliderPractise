//
//  ViewController.swift
//  sliderPractise
//
//  Created by 董禾翊 on 2022/9/1.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var textLable: UILabel!
    @IBOutlet weak var starView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var rabbitUIImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addGradient()
        starView.transform = CGAffineTransform(translationX: 0, y: -150)
        textLable.alpha = 0
    }
    //加入漸層
    func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [CGColor(red: 0, green: 0, blue: 0, alpha: 1), CGColor(red: 0, green: 0, blue: 1, alpha: 1)]
        gradientLayer.locations = [0.3, 1]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    //定義星星位移一度與畫圓半徑
    func starViewUpdateLocation(degrees: CGFloat){
        starView.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi / 180 * degrees).translatedBy(x: 0, y: -150)
       
    }
    @IBAction func slider(_ sender: UISlider) {
        //控制嫦娥
        contentView.transform = CGAffineTransform.identity.translatedBy(x: 570 * CGFloat(sender.value / 15), y: -180 * CGFloat(sender.value / 15)).scaledBy(x: 1 * CGFloat(1 - sender.value / 15 * 0.5), y: 1 * CGFloat(1 - sender.value / 15 * 0.5))
        contentView.alpha = 1 - CGFloat(sender.value / 15 * sender.value / 15)
        //控制玉兔
        let gifName = String(format: "68e8c505a9be49c48ba260a3dc532bebeH9j2Xm9iAXcnhEJ-%02d", arguments: [Int(sender.value)])
        rabbitUIImage.image = UIImage(named: gifName)
        //控制星星
        starViewUpdateLocation(degrees: CGFloat(sender.value * 72))
        //控制文字
        textLable.alpha = CGFloat((sender.value - 13) / 2)
       
    }
}
