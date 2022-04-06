//
//  memeDetailViewController.swift
//  memeAppV1.0
//
//  Created by kishan kumar keshri on 5/04/22.
//

import UIKit

class MemeDetailViewController: UIViewController {

    @IBOutlet weak var memeImageDetail: UIImageView!
    var meme : Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeImageDetail.image = meme.memedImage
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
}
