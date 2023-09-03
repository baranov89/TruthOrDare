//
//  TDTypography.swift
//  TruthOrDare
//
//  Created by Sergei Volkov on 27.08.2022.
//

import SwiftUI

struct TdTypography: ViewModifier {
    enum Style {
        /// Title
        case title1, title2, title3, title4, title5, title6

        /// Headline
        case headline1, headline2, headline3, headline4, headline5

        /// Body
        case body1, body2, body3, body4, body5, body6, body7, body8
    }

    var style: Style

    public func body(content: Content) -> some View {
        switch style {
        case .title1: return content
                .font(.custom("NunitoSans-Light", size: 70))
        case .title2: return content
                .font(.custom("NunitoSans-ExtraBold", size: 40))
        case .title3: return content
                .font(.custom("NunitoSans-Bold", size: 40))
        case .title4: return content
                .font(.custom("NunitoSans-ExtraBold", size: 33))
        case .title5: return content
                .font(.custom("NunitoSans-SemiBold", size: 27))
        case .title6: return content
                .font(.custom("NunitoSans-ExtraBold", size: 25))

        case .headline1: return content
                .font(.custom("NunitoSans-Black", size: 20))
        case .headline2: return content
                .font(.custom("NunitoSans-Black", size: 18))
        case .headline3: return content
                .font(.custom("NunitoSans-Bold", size: 18))
        case .headline4: return content
                .font(.custom("NunitoSans-ExtraBold", size: 17))
        case .headline5: return content
                .font(.custom("NunitoSans-ExtraBold", size: 14))

        case .body1: return content
                .font(.custom("NunitoSans-Bold", size: 22))
        case .body2: return content
                .font(.custom("NunitoSans-SemiBold", size: 22))
        case .body3: return content
                .font(.custom("NunitoSans-SemiBold", size: 20))
        case .body4: return content
                .font(.custom("NunitoSans-SemiBold", size: 18))
        case .body5: return content
                .font(.custom("NunitoSans-SemiBold", size: 17))
        case .body6: return content
                .font(.custom("NunitoSans-SemiBold", size: 16))
        case .body7: return content
                .font(.custom("NunitoSans-SemiBold", size: 14))
        case .body8: return content
                .font(.custom("NunitoSans-SemiBold", size: 13))
        }
    }
}

extension View {
    func tdTypo(_ style: TdTypography.Style) -> some View {
        modifier(TdTypography(style: style))
    }

    func tdTypo(_ style: TdTypography.Style, color: Color) -> some View {
        modifier(TdTypography(style: style))
            .foregroundColor(color)
    }
}
