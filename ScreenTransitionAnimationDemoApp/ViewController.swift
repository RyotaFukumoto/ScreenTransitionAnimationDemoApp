//
//  ViewController.swift
//  ScreenTransitionAnimationDemoApp
//
//  Created by ryota on 2022/03/17.
//

import UIKit

class ViewController: UIViewController,UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tap(_ sender: UIButton) {
        let secondViewController = SecondViewController()
        secondViewController.transitioningDelegate = self
        secondViewController.modalPresentationStyle = .fullScreen
    //        secondViewController.view.backgroundColor = sender.backgroundColor
    //        secondViewController.modalTransitionStyle = .crossDissolve
            self.present(secondViewController, animated: true, completion: nil)
    }
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CrossDissolveTransiton(duration: 0.7)
    }
}

