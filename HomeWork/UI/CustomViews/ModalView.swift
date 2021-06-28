//
//  ModalView.swift
//  HomeWork
//
//  Created by Adel Khaziakhmetov on 21.06.2021.
//

import SwiftUI

struct ModalView: View {
    @Binding var showModal: Bool
    
    var body: some View {
        VStack {
            Text("Это модальное окно")
            
            Button(action: {
                self.showModal.toggle()
            }, label: {
                Text("Закрыть")
                    .padding(20)
                    .foregroundColor(Color.white)
            }).background(Color.red)
            .cornerRadius(8)
            .padding(.top, 50)
        }
    }
}
