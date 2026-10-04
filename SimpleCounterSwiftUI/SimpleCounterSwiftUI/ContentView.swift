import SwiftUI

struct ContentView: View {
    @State var counter: Int = 0
    
    var body: some View {
        VStack {
            Text("Value: \(counter)")
                .padding()
            HStack {
                Button(action: {
                    counter -= 1;
                }, label: {
                    Image(systemName: "minus.square.fill")
                })
                Button(action: {
                    counter += 1;
                }, label: {
                    Image(systemName: "plus.square.fill")
                })
            }
        }
        .font(.largeTitle)
    }
}
