import SwiftUI

struct UserServiceView: View {
    @State private var username: String = "John Doe"
    @State private var email: String = "johndoe@example.com"
    @State private var emailNotificationsEnabled: Bool = true
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("User Profile Management")
                .font(.largeTitle)
                .bold()
            
            // Profile Image and Name
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
                    .padding()
                
                VStack(alignment: .leading) {
                    /*TextField("Username", text: $username)
                     .font(.title2)
                     .padding()
                     .background(Color.gray.opacity(0.2))
                     .cornerRadius(8)
                     
                     TextField("Email", text: $email)
                     .padding()
                     .background(Color.gray.opacity(0.2))
                     .cornerRadius(8)*/
                    
                    Form {
                        TextField("Username", text: $username)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        
                        Button(action: {
                            // Save action (mock)
                        }) {
                            Text("Save Changes")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                }
            }
            
            // Email Notifications Toggle
            Toggle(isOn: $emailNotificationsEnabled) {
                Text("Enable Email Notifications")
                    .font(.headline)
            }
            .padding()
            
            // Change Password Section
            VStack(alignment: .leading, spacing: 10) {
                Text("Change Password")
                    .font(.headline)
                
                SecureField("New Password", text: $newPassword)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Button(action: {
                }) {
                    Text("Update Password")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.top, 20)
            
            // Delete Account Button
            Button(action: {
            }) {
                Text("Delete Account")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct UserServiceView_Previews: PreviewProvider {
    static var previews: some View {
        UserServiceView()
    }
}
