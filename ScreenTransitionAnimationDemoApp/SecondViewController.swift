//
//  SecondViewController.swift
//  ScreenTransitionAnimationDemoApp
//
//  Created by ryota on 2022/03/17.
//

import UIKit

class SecondViewController: UIViewController,UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let closeButton: UIButton = UIButton(frame: self.view.frame)
        closeButton.layer.position = self.view.layer.position
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(UIColor.white, for: .normal)
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        closeButton.backgroundColor = UIColor.orange
        closeButton.addTarget(self, action: #selector(self.close(_:)), for: .touchUpInside)
        self.view.addSubview(closeButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func close(_ sender: UIButton) {
        self.transitioningDelegate = self
        self.modalPresentationStyle = .fullScreen
        self.dismiss(animated: true, completion: nil)
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CrossDissolveTransiton(duration: 0.7)
    }
}
