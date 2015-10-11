//
//  ImageFlickController.swift
//  Dynamics
//
//  Created by Julian Grosshauser on 10/10/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class ImageFlickController: UIViewController {

    //MARK: Properties

    private var dynamicAnimator: UIDynamicAnimator!
    private var itemBehavior: UIDynamicItemBehavior!
    private var collisionBehavior: UICollisionBehavior!
    private let image = UIImageView(image: UIImage(named: "ProfileImage.png"))
    private var offset = CGPoint.zero

    //MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        dynamicAnimator = UIDynamicAnimator(referenceView: view)

        image.center = view.center
        image.userInteractionEnabled = true
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "pan:")
        image.addGestureRecognizer(panGestureRecognizer)
        view.addSubview(image)

        itemBehavior = UIDynamicItemBehavior(items: [image])
        itemBehavior.resistance = 0.5
        dynamicAnimator.addBehavior(itemBehavior)

        collisionBehavior = UICollisionBehavior(items: [image])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
    }

    //MARK: Gesture Recognizers

    @objc
    private func pan(pan: UIPanGestureRecognizer) {
        var location = pan.locationInView(view)

        switch pan.state {
        case .Began:
            let center = image.center
            offset.x = location.x - center.x
            offset.y = location.y - center.y

        case .Changed:
            let referenceBounds = view.bounds
            let referenceWidth = referenceBounds.width
            let referenceHeight = referenceBounds.height

            let itemBounds = image.bounds
            let itemHalfWidth = itemBounds.width / 2.0
            let itemHalfHeight = itemBounds.height / 2.0

            location.x -= offset.x
            location.y -= offset.y

            location.x = max(itemHalfWidth, location.x)
            location.x = min(referenceWidth - itemHalfWidth, location.x)
            location.y = max(itemHalfHeight, location.y)
            location.y = min(referenceHeight - itemHalfHeight, location.y)

            image.center = location

        case .Cancelled, .Ended:
            let velocity = pan.velocityInView(view)
            itemBehavior.addLinearVelocity(velocity, forItem: image)

        default:
            ()
        }
    }
}
