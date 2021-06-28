//
//  DetailScreen.swift
//  HomeWork
//
//  Created by Adel Khaziakhmetov on 21.06.2021.
//

import SwiftUI

struct DetailScreen: View {
    @StateObject var model: DetailModel
    @EnvironmentObject var routing: Routing

    var body: some View {
        VStack {
            VStack(spacing: 7) {
                HStack {
                    Text("Идентификатор фотографии:")
                        .font(.system(size: 15).bold())
                    Spacer()
                }
                HStack {
                    Text(model.id)
                        .font(.system(size: 15))
                    Spacer()
                }
                HStack {
                    Text("Описание фотографии:")
                        .font(.system(size: 15).bold())
                    Spacer()
                }
                .padding(.top, 5)
                HStack {
                    Text(model.title)
                        .font(.system(size: 15))
                    Spacer()
                }
            }
            .padding([.leading, .trailing], 20)
            
            HStack {
                Spacer()
                ResizableImage(image: $model.image)
                    .fixedSize()
                    .onAppear {
                    model.fetchImage()
                }
                Spacer()
            }
            .padding(.top, 100)
            
            Spacer()
        }
        .padding(.top, 20)
        .onAppear {
            routing.shouldSelectDetail = false
        }
    }
}
