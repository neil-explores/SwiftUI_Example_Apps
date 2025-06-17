import SwiftUI

struct MessageView: View {
    @Environment(Alphabetizer.self) private var alphabetizer
    
    var body: some View {
        Text(alphabetizer.message.rawValue)
            .font(.largeTitle)
    }
}

#Preview {
    let alphabetizer = Alphabetizer()
    alphabetizer.message = .youWin
    // needs the `return` keyword
    // Because there are multiple lines here...
    return MessageView()
        .environment(alphabetizer)
}
