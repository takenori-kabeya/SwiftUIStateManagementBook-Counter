import SwiftUI
import ComposableArchitecture

@main
struct SimpleCounterTCAApp: App {
    var body: some Scene {
        WindowGroup {
            ParentView(store: Store(initialState: ParentFeature.State()) {
                ParentFeature()
            })
        }
    }
}
