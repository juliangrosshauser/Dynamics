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
    private let image = UIImageView(image: UIImage(named: "ProfileImage.png"))

    //MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        dynamicAnimator = UIDynamicAnimator(referenceView: view)

        image.center = view.center
        view.addSubview(image)

        itemBehavior = UIDynamicItemBehavior(items: [image])
        itemBehavior.resistance = 0.5
        dynamicAnimator.addBehavior(itemBehavior)
    }
}
