//
//  NewsfeedInteractor.swift
//  VKNewsFeed
//
//  Created by Denis Suspicin on 16.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
    func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {
    
    var presenter: NewsfeedPresentationLogic?
    var service: NewsfeedService?
    
    func makeRequest(request: Newsfeed.Model.Request.RequestType) {
        if service == nil {
            service = NewsfeedService()
        }
        
        switch request {
        case .some:
            print(".some Interactor")
            presenter?.presentData(response: .some)
        case .getFeed:
            print(".getFeed Interactor")
            presenter?.presentData(response: .presentNewsFeed)
        }
    }
    
}