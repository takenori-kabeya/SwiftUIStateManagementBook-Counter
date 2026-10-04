import SwiftUI
import ComposableArchitecture

@main
struct SimpleCounterTCAApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: CounterFeature.State()) {
                CounterFeature()
            })
        }
    }
}
