import TokamakDOM

struct TokamakApp: App {
    @StateObject private var hashState = HashState()
    
    var body: some Scene {
        WindowGroup("Tokamak App") {
            ContentView()
                .environmentObject(hashState)
        }
    }
}

// @main attribute is not supported in SwiftPM apps.
// See https://bugs.swift.org/browse/SR-12683 for more details.
TokamakApp.main()
