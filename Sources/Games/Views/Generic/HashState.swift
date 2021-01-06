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

var route: String {
    guard let slices = location?.description.split(separator: "#"),
          slices.count > 1, //We are not in the root
          let slice = slices.last else {
        return ""
    }
    return String(slice)
}

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
