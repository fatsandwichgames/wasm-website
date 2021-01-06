//
//  Markdown.swift
//  Games
//
//  Created by Szymon Lorenz on 13/12/20.
//

import Foundation
import TokamakDOM
import JavaScriptKit

struct Markdown: View {
    @State var object: JSObject?
    let content: String = "# Marked in the browser\n\nRendered by **marked**."
    
    private var hash: String {
        let inputData = Data(content.utf8)
        let hashString = inputData.compactMap { String(format: "%02x", $0) }.joined()
        return hashString
    }
    
    private var containerId: String {
        "tokamak.markdown.\(hash)"
    }
    
    var body: some View {
        /*
         <div id="content"></div>
           <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
           <script>
             document.getElementById('content').innerHTML =
               marked('# Marked in the browser\n\nRendered by **marked**.');
           </script>
         */
        HTML("script", ["src":"https://cdn.jsdelivr.net/npm/marked/marked.min.js"]) {
            HTML("div", ["id":containerId]) {
                HTML("div")
            }
            ._domRef($object)
            .onAppear {
//                object?.innerHTML = .string("document.getElementById('\(containerId)').innerHTML = marked('\(content)');")
//                object?.innerHTML = .string("""
//                <script>
//                 document.getElementById('\(containerId)').innerHTML =
//                   marked('\(content)');
//                </script>
//                """)
            }
        }
    }
}
