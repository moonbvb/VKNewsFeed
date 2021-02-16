//
//  NewsfeedPresenter.swift
//  VKNewsFeed
//
//  Created by Denis Suspicin on 16.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
    func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
    weak var viewController: NewsfeedDisplayLogic?
    
    func presentData(response: Newsfeed.Model.Response.ResponseType) {
        
        switch response {
        case .some:
            print(".some Presenter")
            viewController?.displayData(viewModel: .displayNewsFeed)
        case .presentNewsFeed:
            print(".presentNewsFeed Presenter")
            viewController?.displayData(viewModel: .displayNewsFeed)
        }
        
    }
    
}
