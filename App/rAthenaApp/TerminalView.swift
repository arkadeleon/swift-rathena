//
//  TerminalView.swift
//  rAthenaApp
//
//  Created by Leon Li on 2022/11/2.
//

import SwiftUI
import Terminal

struct TerminalView: UIViewRepresentable {
    private let terminalView = Terminal.TerminalView()

    func makeUIView(context: Context) -> Terminal.TerminalView {
        return terminalView
    }

    func updateUIView(_ uiView: Terminal.TerminalView, context: Context) {
    }

    func appendBuffer(_ buffer: Data) {
        terminalView.appendBuffer(buffer)
    }

    func clear() {
        terminalView.terminalClear(.reset)
    }
}

struct TerminalView_Previews: PreviewProvider {
    static var previews: some View {
        TerminalView()
    }
}
