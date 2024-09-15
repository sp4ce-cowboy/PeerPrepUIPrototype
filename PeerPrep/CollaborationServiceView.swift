import SwiftUI

struct CollaborationServiceView: View {
    @State private var codeInput: String = """
    // Write your code here
    func helloWorld() {
        print("Hello, world!")
    }
    """
    @State private var chatMessages: [String] = ["User1: Let's start with the solution", "User2: Sure!"]
    @State private var newMessage: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Collaboration Session")
                .font(.largeTitle)
                .bold()
            
            // Coding Area
            VStack(alignment: .leading) {
                Text("Collaborative Coding")
                    .font(.headline)
                
                TextEditor(text: $codeInput)
                    .font(.system(.body, design: .monospaced))
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .frame(height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }
            
            // Chat Area
            VStack(alignment: .leading, spacing: 10) {
                Text("Live Chat")
                    .font(.headline)
                
                ScrollView {
                    ForEach(chatMessages, id: \.self) { message in
                        Text(message)
                            .padding(10)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .frame(height: 150)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                
                HStack {
                    TextField("Enter message", text: $newMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        sendMessage()
                    }) {
                        Text("Send")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            
            // Toolbar (Start/End Session)
            HStack {
                Button(action: {
                    // Mock start session action
                }) {
                    Text("Start Session")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    // Mock end session action
                }) {
                    Text("End Session")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            
            Spacer()
        }
        .padding()
    }
    
    // Function to send a new chat message
    func sendMessage() {
        if !newMessage.isEmpty {
            chatMessages.append("You: \(newMessage)")
            newMessage = ""
        }
    }
}

struct CollaborationServiceView_Previews: PreviewProvider {
    static var previews: some View {
        CollaborationServiceView()
    }
}
