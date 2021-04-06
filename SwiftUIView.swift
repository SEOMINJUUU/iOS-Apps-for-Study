//
//  SwiftUIView.swift
//  
//
//  Created by 서민주 on 2020/11/20.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    private var loginView: some View {
        VStack(spacing: 30) {
            Image(viewModel.loginConImage)
            VStack(spacing: 10) {
                titleText
                descriptionText
            }
            kakaoLoginButton
        }
        .padding([.leading, .trailing], 16)
    }
    
    private var titleText: Text {
        Text(viewModel.title)
            .font(.system(size: 18))
            .foregroundColor(.black25)
    }
    
    private var kakaoLoginButton: some View {
        Button(action: viewModel.kakaoLogin) {
            HStack(alignment: .center, spacing: 6.0) {
                Image(viewModel.kakaoButtonIcon)
                Text(viewModel.kakaoButtonTitle)
            }
            .buttonStyle(KakaoButtonStyle())
        }
    }
}

fileprivate var kakaoLoginButton: View {
    @Binding var viewModel: LoginViewModel
    
    var body: some View  {
        Button(action: viewModel.kakaoLogin) {
            HStack(alignment: .center, spacing: 6.0) {
                Image(viewModel.kakaoButtonIcon)
                Text(viewModel.kakaoButtonTitle)
            }
            .buttonStyle(KakaoButtonStyle())
        }
        
    }
}

struct KakaoButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.configuration) -> some View {
        configuration.label
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .font(.system(size: 15, weight: .semibold, design: .default))
            .foregroundColor(Color(hex: 0x191919))
            .background(Color(hex: 0xffe500))
            .overlay(configuration.isPressed ? Color(hex: 0x000000, alpha: 0.04) : nil)
            .cornerRadius(6.0)
    }
}

struct NormalButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.configuration) -> some View {
        configuration.label
            .frame(width: 230, height: 45)
            .font(.system(size: 14))
            .foregroundColor(Color(hex: 0x191919))
            .background(Color(hex: 0x000000, alpha: 0.04    ))
            .overlay(configuration.isPressed ? Color(hex: 0x000000, alpha: 0.04) : nil)
            .cornerRadius(6.0)
    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}



