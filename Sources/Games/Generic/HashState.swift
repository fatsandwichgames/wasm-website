//
//  HashState.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import TokamakDOM
import JavaScriptKit

let location = JSObject.global.location.object
let window = JSObject.global.window.object

final class HashState: ObservableObject {
    var onHashChange: JSClosure!
    
    @Published var currentHash = location?.hash.string
    
    init() {
        let onHashChange = JSClosure { [weak self] _ in
            self?.currentHash = location?.hash.string
        }
        window?.onhashchange = .function(onHashChange)
        self.onHashChange = onHashChange
    }
    
    deinit {
        window?.onhashchange = .undefined
        onHashChange.release()
    }
}
