import SwiftUI

struct MatchingServiceView: View {
    @State private var selectedDifficulty: String = "Medium"
    @State private var selectedTopic: String = "Algorithms"
    @State private var isMatching: Bool = false
    @State private var matchFound: Bool = false
    @State private var timedOut: Bool = false
    
    let difficulties = ["Easy", "Medium", "Hard"]
    let topics = ["Algorithms", "Data Structures", "Databases", "System Design"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Find a Peer")
                .font(.largeTitle)
                .bold()
            
            // Difficulty Level Picker
            VStack(alignment: .leading) {
                Text("Select Difficulty Level")
                    .font(.headline)
                
                Picker("Difficulty", selection: $selectedDifficulty) {
                    ForEach(difficulties, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
            
            // Topic Picker
            VStack(alignment: .leading) {
                Text("Select Topic")
                    .font(.headline)
                
                Picker("Topic", selection: $selectedTopic) {
                    ForEach(topics, id: \.self) {
                        Text($0)
                    }
                }
                .padding()
            }
            
            // Match Button
            Button(action: {
                startMatching()
            }) {
                Text("Start Matching")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isMatching ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(isMatching)
            
            // Matching Progress Indicator
            if isMatching {
                ProgressView("Matching...")
                    .padding(.top, 20)
            }
            
            // Match Result or Timeout Message
            if matchFound {
                Text("Match found! 🎉")
                    .foregroundColor(.green)
                    .font(.title2)
                    .padding(.top, 20)
            } else if timedOut {
                Text("Matching timed out ⏰")
                    .foregroundColor(.red)
                    .font(.title2)
                    .padding(.top, 20)
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            resetMatchState()
        }
    }
    
    // Simulate the matching process
    func startMatching() {
        isMatching = true
        matchFound = false
        timedOut = false
        
        // Simulate matching delay (3 seconds)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let success = Bool.random()
            isMatching = false
            if success {
                matchFound = true
            } else {
                timedOut = true
            }
        }
    }
    
    func resetMatchState() {
        isMatching = false
        matchFound = false
        timedOut = false
    }
}

struct MatchingServiceView_Previews: PreviewProvider {
    static var previews: some View {
        MatchingServiceView()
    }
}
