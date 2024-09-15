import SwiftUI

struct QuestionServiceView: View {
    @State private var selectedDifficulty: String = "Medium"
    @State private var selectedTopic: String = "Algorithms"
    @State private var selectedPopularity: String = "Common"
    @State private var selectedQuestion: String? = nil
    
    let difficulties = ["Easy", "Medium", "Hard"]
    let popularity = ["Common", "Uncommon", "Rare"]
    let topics = ["Algorithms", "Data Structures", "Databases", "System Design"]
    let questions = [
        "What is a binary search?",
        "Explain time complexity.",
        "What is a hash map?",
        "Describe the quicksort algorithm."
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Browse Questions")
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
            
            // Popularity Picker
            VStack(alignment: .leading) {
                Text("Select Popularity")
                    .font(.headline)
                
                Picker("Popularity", selection: $selectedPopularity) {
                    ForEach(popularity, id: \.self) {
                        Text($0)
                    }
                }
                .padding()
            }
            
            // Question List
            VStack(alignment: .leading) {
                Text("Available Questions")
                    .font(.headline)
                
                List(questions, id: \.self) { question in
                    Button(action: {
                        selectedQuestion = question
                    }) {
                        Text(question)
                            .padding()
                    }
                }
                .frame(height: 250)
            }
            
            // Selected Question Details
            if let question = selectedQuestion {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Question Details")
                        .font(.title2)
                        .bold()
                    
                    Text("Question: \(question)")
                        .padding(.top, 8)
                    
                    Text("Difficulty: \(selectedDifficulty)")
                    Text("Topic: \(selectedTopic)")
                    
                    Text("Example Answer: This is a sample answer explaining the question in detail. You can write your answer here or discuss with your peer.")
                        .padding(.top, 8)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.top, 16)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct QuestionServiceView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionServiceView()
    }
}
