import SwiftUI
import ComposableArchitecture

struct ParentView: View {
    var store: StoreOf<ParentFeature>
    @State var text: String = ""
    
    var body: some View {
        VStack {
            TextField("何かのテキスト", text: $text)
                .textFieldStyle(.roundedBorder)
                .font(.title)
                .padding()
            Text("Text: \(store.text)")
            HStack {
                Text("Value: \(store.counter.counter)")
                    .padding()
                Button(action: {
                    store.send(.resetButtonTapped)
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                })
            }
            .font(.largeTitle)
            ContentView(store: Store(initialState: store.counter) {
                CounterFeature()
            })
            .padding()
            .background(.mint)
        }
        .padding()
        .background(.gray)
        .onChange(of: text) { _, newText in
            store.send(.textChanged(newText))
        }
    }
}

#Preview {
    ParentView(store: Store(initialState: ParentFeature.State()) {
        ParentFeature()
    })
}

