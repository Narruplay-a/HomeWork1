//
//  ModalScreen.swift
//  HomeWork
//
//  Created by Adel Khaziakhmetov on 21.06.2021.
//

import SwiftUI

struct ModalScreen: View {
    @State var showModal: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.showModal.toggle()
            }, label: {
                Text("Открыть модальное окно")
                    .padding(20)
                    .foregroundColor(.white)
            }).background(Color.blue)
            .cornerRadius(8)
            .fullScreenCover(isPresented: self.$showModal) {
                ModalView(showModal: self.$showModal)
            }
        }
    }
}
