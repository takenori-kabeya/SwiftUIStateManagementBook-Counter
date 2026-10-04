import SwiftUI
import ComposableArchitecture

@Reducer
struct ParentFeature {
    @ObservableState
    struct State {
        var text: String = ""
        var counter: CounterFeature.State = .init()
    }
    
    enum Action {
        case counter(CounterFeature.Action)
        case resetButtonTapped
        case textChanged(String)
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: \.counter, action: \.counter) {
            CounterFeature()
        }
        Reduce { state, action in
            switch action {
            case .counter:
                return .none
            case .resetButtonTapped:
                state.counter.counter = 5
                return .none
            case let .textChanged(newText):
                state.text = newText
                return .none
            }
        }
    }
}

@Reducer
struct CounterFeature {
    @ObservableState
    struct State {
        var counter: Int = 0
    }
    
    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
        case incrementDelayCompleted
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.counter -= 1
                return .none
            case .incrementButtonTapped:
                return .run { send in
                    try await Task.sleep(for: .seconds(1))
                    await send(.incrementDelayCompleted)
                }.cancellable(id: 1, cancelInFlight: true)
            case .incrementDelayCompleted:
                state.counter += 1
                return .none
            }
        }
    }
}

struct ContentView: View {
    var store: StoreOf<CounterFeature>
    
    var body: some View {
        VStack {
            Text("Value: \(store.counter)")
                .padding()
            HStack {
                Button(action: {
                    store.send(.decrementButtonTapped)
                }, label: {
                    Image(systemName: "minus.square.fill")
                })
                Button(action: {
                    store.send(.incrementButtonTapped)
                }, label: {
                    Image(systemName: "plus.square.fill")
                })
            }
        }
        .font(.largeTitle)
    }
}

#Preview {
    ContentView(store: Store(initialState: CounterFeature.State()) {
        CounterFeature()
    })
}

