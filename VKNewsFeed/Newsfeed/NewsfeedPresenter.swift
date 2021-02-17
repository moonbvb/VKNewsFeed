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
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ru_RU")
        df.dateFormat = "d MMM 'в' HH:mm"
        return df
    }()
    
    func presentData(response: Newsfeed.Model.Response.ResponseType) {
        
        switch response {
        case .presentNewsFeed(let feed):
            
            let cells = feed.items.map { (feedItem) in
                cellViewModel(from: feedItem, profiles: feed.profiles, groups: feed.groups)
            }

            let feedViewModel = FeedViewModel.init(cells: cells)
            viewController?.displayData(viewModel: .displayNewsFeed(feedViewModel: feedViewModel))
        }
        
    }
    
    private func cellViewModel(from feedItem: FeedItem, profiles: [Profile], groups: [Group]) -> FeedViewModel.Cell {
        
        let profile = self.profile(for: feedItem.sourceId, profiles: profiles, groups: groups)
        let date = Date(timeIntervalSince1970: feedItem.date)
        let dateTitle = dateFormatter.string(from: date)
        let photoAttachment = self.photoAttachment(feedItem: feedItem)
        
        return FeedViewModel.Cell.init(iconUrlString: profile.photo,
                                       name:  profile.name,
                                       date: dateTitle,
                                       text: feedItem.text,
                                       photoAttachment: photoAttachment,
                                       likes: String(feedItem.likes?.count ?? 0),
                                       comments: String(feedItem.comments?.count ?? 0),
                                       shares: String(feedItem.reposts?.count ?? 0),
                                       views: String(feedItem.views?.count ?? 0))
    }
    
    private func profile(for soursId: Int, profiles: [Profile], groups: [Group]) -> ProfileRepresentable {
        let profilesOrGroups: [ProfileRepresentable] = soursId >= 0 ? profiles : groups
        let normalSourseId = soursId >= 0 ? soursId : -soursId
        let profileRepresentable = profilesOrGroups.first { (myProfileRepresentable) -> Bool in
            myProfileRepresentable.id == normalSourseId
        }
        return profileRepresentable!
    }
    
    private func photoAttachment(feedItem: FeedItem) -> FeedViewModel.FeedCellPhotoAttachment? {
        guard let photos = feedItem.attachment?.compactMap({ (attachment) in
            attachment.photo
        }), let firstPhoto = photos.first else {
            return nil
        }
        return FeedViewModel.FeedCellPhotoAttachment.init(photoUrlString: firstPhoto.srcBIG,
                                                          width: firstPhoto.width,
                                                          height: firstPhoto.height)
    }
}
