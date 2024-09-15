import SwiftUI

struct ContentView: View {
    @State private var selectedView: String? = "UserService"
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: UserServiceView(), tag: "UserService", selection: $selectedView) {
                    Label("User Service", systemImage: "person.crop.circle")
                }
                NavigationLink(destination: MatchingServiceView(), tag: "MatchingService", selection: $selectedView) {
                    Label("Matching Service", systemImage: "person.2.square.stack")
                }
                NavigationLink(destination: QuestionServiceView(), tag: "QuestionService", selection: $selectedView) {
                    Label("Question Service", systemImage: "questionmark.circle")
                }
                NavigationLink(destination: CollaborationServiceView(), tag: "CollaborationService", selection: $selectedView) {
                    Label("Collaboration Service", systemImage: "rectangle.and.pencil.and.ellipsis")
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 200)
            
            // Default content when no view is selected
            Text("Select a service from the sidebar")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(minWidth: 600, minHeight: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
