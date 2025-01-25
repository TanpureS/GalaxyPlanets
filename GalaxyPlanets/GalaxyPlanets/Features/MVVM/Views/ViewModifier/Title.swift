//
//  Title.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 25/01/25.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .foregroundStyle(.black)
            .padding(8)
            .clipShape(.rect(cornerRadius: 2))
    }
}
