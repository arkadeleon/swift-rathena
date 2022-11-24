//
//  TerminalView.swift
//  ROServer
//
//  Created by Leon Li on 2022/11/2.
//

import SwiftUI
import Terminal

struct TerminalView: UIViewRepresentable {
    @Binding var clear: Bool
    @Binding var pendingData: Data

    func makeUIView(context: Context) -> Terminal.TerminalView {
        Terminal.TerminalView()
    }

    func updateUIView(_ uiView: Terminal.TerminalView, context: Context) {
        if clear {
            uiView.terminalClear(.reset)
            clear.toggle()
        }

        uiView.appendBuffer(pendingData)
    }
}

struct TerminalView_Previews: PreviewProvider {
    static var previews: some View {
        TerminalView(clear: .constant(false), pendingData: .constant(Data()))
    }
}
