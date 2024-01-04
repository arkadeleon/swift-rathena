//
//  ServerTerminalView.swift
//  rAthenaApp
//
//  Created by Leon Li on 2022/11/2.
//

import SwiftUI
import Terminal

struct ServerTerminalView: UIViewRepresentable {
    private let terminalView = TerminalView()

    func makeUIView(context: Context) -> TerminalView {
        return terminalView
    }

    func updateUIView(_ terminalView: TerminalView, context: Context) {
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
        ServerTerminalView()
    }
}
