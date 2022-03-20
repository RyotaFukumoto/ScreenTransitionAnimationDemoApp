//
//  CrossDissolveTransiton.swift
//  ScreenTransitionAnimationDemoApp
//
//  Created by ryota on 2022/03/20.
//

import UIKit


class CrossDissolveTransiton: NSObject, UIViewControllerAnimatedTransitioning{
    var duration: TimeInterval

    init(duration: TimeInterval) {
        self.duration = duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
    
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
      
        container.addSubview(toView)
        
        toView.alpha = .zero
    
        toView.layoutIfNeeded()
        UIView.animate(withDuration: duration, animations: { [weak self] in
            guard self != nil else { return }
            toView.alpha = fromView.alpha
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
}
