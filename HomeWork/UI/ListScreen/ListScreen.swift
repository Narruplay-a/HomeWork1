//
//  ListScreen.swift
//  HomeWork
//
//  Created by Adel Khaziakhmetov on 21.06.2021.
//

import SwiftUI
import Combine

struct ListScreen: View {
    @StateObject var model: ListModel
    @EnvironmentObject var routing: Routing

    var body: some View {
        NavigationView {
            switch model.dataLoadingStatus {
            case .failed:
                Text("Произошла ошибка!")
                    .navigationTitle("Изображения земли")
                    .navigationBarTitleDisplayMode(.inline)
            case .loading:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            case .data:
                List(model.images, id: \.id) { image in
                    PhotoCell(model: PhotoCellModel(with: image, publisher: model.$imageToOpen))
                }
                .navigationTitle("Изображения земли")
                .navigationBarTitleDisplayMode(.inline)
            }
        }.onAppear {
            model.fetchData(routing.shouldSelectDetail)
        }
    }
}

