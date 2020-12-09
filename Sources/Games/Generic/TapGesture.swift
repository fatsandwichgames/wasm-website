//
//  TapGesture.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import TokamakDOM
import JavaScriptKit

struct TapGesture<Content: View>: View {
    @State private var object: JSObject?
    @State private var onTap: JSClosure?
    
    var action: () -> Void
    var closure: () -> Content
    
    var body: some View {
        closure()
            ._domRef($object)
            .onAppear {
                onTap = JSClosure { _ in
                    action()
                }
                _ = object?.addEventListener!("click", onTap)
            }.onDisappear {
                _ = object?.removeEventListener!("click", onTap)
                onTap?.release()
            }
    }
}
