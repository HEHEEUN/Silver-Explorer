//
//  HomeViewController.swift
//  Silver Explorer
//
//  Created by Jinyoung Yoo on 2023/07/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    let resource: HomeResourse = HomeResourse()
    var storyBoardIDs: [Content: String] {
        return resource.storyBoardIDs
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func uiExploreBtnPressed(_ sender: UIButton) {
        moveToContentVC(homeVC: self, content: .UIExplore, storyBoardID: storyBoardIDs[.UIExplore]!)
    }
    
    
    @IBAction func arKioskBtnPressed(_ sender: UIButton) {
        moveToKioskHomeVC(vc: self)

    }
    
    
    @IBAction func aiExplore(_ sender: UIButton) {
    }
}
