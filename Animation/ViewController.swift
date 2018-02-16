//
//  ViewController.swift
//  Animation
//
//  Created by Vikky Chaudhary on 30/12/17.
//  Copyright © 2017 Vikky Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    var counter=1
    var timer=Timer()
    var isanimate=false
    
    @IBAction func fadein(_ sender: Any) {
        image.alpha=0
        UIView.animate(withDuration: 10, animations: {
            self.image.alpha=1
        })
    }
    @IBAction func slidein(_ sender: Any) {
        image.center=CGPoint(x: image.center.x-500, y: image.center.y)
        UIView.animate(withDuration: 10)
        {
            self.image.center=CGPoint(x: self.image.center.x+500, y: self.image.center.y)
        }
    }
    @IBAction func grow(_ sender: Any) {
        image.frame=CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 1){
            self.image.frame=CGRect(x: 50, y: 200, width: 200, height: 200)
        }
    }
    @objc func start(){
        image.image=UIImage(named: "frame_\(counter)_delay-0.04s.gif")
        counter+=1
        if counter==11{
            counter=0
        }
    }
    @IBAction func next(_ sender: Any) {
        if isanimate{
            timer.invalidate()
            button.setTitle("Start", for: [])
            isanimate=false
        }else{
        timer=Timer.scheduledTimer(timeInterval: 0.04, target: self, selector: #selector(ViewController.start), userInfo: nil, repeats: true)
            button.setTitle("Stop", for: [])
            isanimate=true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

