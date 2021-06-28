//
//  ListModel.swift
//  HomeWork
//
//  Created by Adel Khaziakhmetov on 21.06.2021.
//

import Combine
import SwiftUI

final class ListModel: ObservableObject {
    private let dataService = DataService()
    private var cancellables: Set<AnyCancellable> = Set()
    
    @Published var dataLoadingStatus: DataLoadingStatus = .loading
    @Published var imageToOpen: EarthImageEntity? = nil

    var images: [EarthImageEntity] = []
    
    func fetchData(_ shouldOpenDetails: Bool) {
        if images.count > 0 && shouldOpenDetails {
            imageToOpen = images.first
        }
        
        dataService.fetchEarthPhotos()
        .sink(receiveCompletion: { completion in
            if case .failure = completion {
                self.dataLoadingStatus = .failed
            }
        }, receiveValue: { [weak self] images in
            self?.images = images
            self?.dataLoadingStatus = .data
            
            if shouldOpenDetails {
                self?.imageToOpen = images.first
            }
        }).store(in: &cancellables)
    }
    
    deinit {
        for cancel in cancellables {
            cancel.cancel()
        }
    }
}

enum DataLoadingStatus {
    case loading
    case failed
    case data
}
