//
//  ContentView.swift
//  rAthenaApp
//
//  Created by Leon Li on 2022/11/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    ServerView(serverType: .login)
                        .frame(width: (geometry.size.width - 16 * 3) / 2, height: (geometry.size.height - 16 * 3) / 2)

                    ServerView(serverType: .char)
                        .frame(width: (geometry.size.width - 16 * 3) / 2, height: (geometry.size.height - 16 * 3) / 2)
                }

                HStack(spacing: 16) {
                    ServerView(serverType: .map)
                        .frame(width: (geometry.size.width - 16 * 3) / 2, height: (geometry.size.height - 16 * 3) / 2)

                    ServerView(serverType: .web)
                        .frame(width: (geometry.size.width - 16 * 3) / 2, height: (geometry.size.height - 16 * 3) / 2)
                }
            }
            .padding(16)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
