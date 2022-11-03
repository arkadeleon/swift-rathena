//
//  ContentView.swift
//  ROServer
//
//  Created by Leon Li on 2022/11/2.
//

import rAthena
import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 16) {
                LoginServerView()
                    .frame(width: geometry.size.width - 16 * 2, height: (geometry.size.height - 16 * 5) / 4)

                CharServerView()
                    .frame(width: geometry.size.width - 16 * 2, height: (geometry.size.height - 16 * 5) / 4)

                MapServerView()
                    .frame(width: geometry.size.width - 16 * 2, height: (geometry.size.height - 16 * 5) / 4)

                WebServerView()
                    .frame(width: geometry.size.width - 16 * 2, height: (geometry.size.height - 16 * 5) / 4)
            }
            .padding(16)
            .task {
                try? ResourceManager.shared.copyBundleResourceFiles()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
