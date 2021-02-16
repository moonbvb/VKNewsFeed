//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Denis Suspicin on 10.02.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.3729973733, green: 0.6846226454, blue: 1, alpha: 1)
        
        fetcher.getFeed { (feedResponse) in
//            guard let feedResponse = feedResponse else { return }
//            feedResponse.items.map { (feedItem) in
//                print(feedItem.comments)
//            }
            print("s")
        }
        
    }
}

