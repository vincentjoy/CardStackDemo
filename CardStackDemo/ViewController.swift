//
//  ViewController.swift
//  CardStackDemo
//
//  Created by Rehlat Online Services Pvt Ltd on 27/12/20.
//

import UIKit
import CardStack

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    var childVC = [ChildVCInfo]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let vc1 = ChildVCInfo.init(title: "Proceed to EMI selection", identifier: "VC1")
        let vc2 = ChildVCInfo.init(title: "Select your bank account", identifier: "VC2")
        let vc3 = ChildVCInfo.init(title: "Tap for 1-click KYC", identifier: "VC3")
        let vc4 = ChildVCInfo.init(title: "Finish payment", identifier: "VC4")
        childVC = [vc1,vc2,vc3,vc4]
        
        /// In this example we are adding the CardContainer viiew controller to a container view. We can also push or present this view controller.
        let cards = CardContainer.init(with: childVC, gap: 120, storyboard: self.storyboard!) // We are passing the storyboard where view controllers with id VC1, VC2, VC3 and VC4 are added
        cards.delegate = self
        cards.willMove(toParent: self)
        self.addChild(cards)
        containerView.addSubview(cards.view)
        cards.didMove(toParent: self)
        let w = containerView.frame.size.width
        let h = containerView.frame.size.height
        cards.view.frame = CGRect(x: 0, y: 0, width: w, height: h)
    }
}

extension ViewController: CardContainerDelegate {
    
    /// Gets called when every time a new card is added
    /// Since ChildVCInfo is a Class, any changes happening to each element in childVC array will be available here as well
    /// So we can easily get the refferencce of the view controller inside each card
    
    func cardAdded(at index:Int) {
        
        print("\nCard added at")
        
        switch index {
        case 0:
            if let vc = childVC[index].vc as? FirstViewController {
                vc.someAction()
            }
        case 1:
            if let vc = childVC[index].vc as? SecondViewController {
                vc.someAction()
            }
        case 2:
            if let vc = childVC[index].vc as? ThirdViewController {
                vc.someAction()
            }
        case 3:
            if let vc = childVC[index].vc as? FourthViewController {
                vc.someAction()
            }
        default:
            print("Nil")
        }
    }
    
    /// Get called when every time a card is selected. Means, all the cards infront of it have already disappeared. So this card will be currently in focus.
    func cardSelected(at index:Int) {
        
        print("\nCard selected at")
        
        switch index {
        case 0:
            if let vc = childVC[index].vc as? FirstViewController {
                vc.someAction()
            }
        case 1:
            if let vc = childVC[index].vc as? SecondViewController {
                vc.someAction()
            }
        case 2:
            if let vc = childVC[index].vc as? ThirdViewController {
                vc.someAction()
            }
        case 3:
            if let vc = childVC[index].vc as? FourthViewController {
                vc.someAction()
            }
        default:
            print("Nil")
        }
    }
}
