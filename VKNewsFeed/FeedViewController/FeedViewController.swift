//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Denis Suspicin on 10.02.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.3729973733, green: 0.6846226454, blue: 1, alpha: 1)
        
        networkService.getFeed()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
