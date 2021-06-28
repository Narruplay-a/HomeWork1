//
//  PhotoCell.swift
//  HomeWork
//
//  Created by Adel Khaziakhmetov on 22.06.2021.
//

import SwiftUI
import Combine

struct PhotoCell: View {
    @StateObject var model: PhotoCellModel

    var body: some View {
        VStack {
            NavigationLink(
                destination: DetailScreen(model: DetailModel(with: model.imageEntity)),
                isActive: $model.toggle,
                label: {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Дата фотографии:")
                                .font(.system(size: 13).bold())
                            Text("Время фотографии:")
                                .font(.system(size: 13).bold())
                                .padding(.top, 5)
                        }

                        VStack(alignment: .leading) {
                            Text(model.imageEntity.date)
                                .font(.system(size: 15))
                            Text(model.imageEntity.time)
                                .font(.system(size: 15))
                                .padding(.top, 3)
                        }

                        Spacer()
                    }
                })
        }.padding(5)
    }
}

class PhotoCellModel: ObservableObject {
    @Published var toggle: Bool = false
    
    var imageEntity: EarthImageEntity
    private var cancelables: Set<AnyCancellable> = Set()
    
    init(with imageEntity: EarthImageEntity, publisher: Published<EarthImageEntity?>.Publisher) {
        self.imageEntity = imageEntity
        
        publisher
        .receive(on: RunLoop.main)
        .sink { entity in
            if entity?.id == imageEntity.id {
                self.toggle = true
            } else {
                self.toggle = false
            }
        }.store(in: &cancelables)
    }
    
    deinit {
        for cancel in cancelables {
            cancel.cancel()
        }
        cancelables = Set()
    }
}
