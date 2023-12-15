import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    @State private var numberOfCharacters = 0
    @State private var isInputValid = false
    
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Spacer(minLength: 25)
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { newValue in
                        numberOfCharacters = newValue.count
                        updateInputState()
                    }
                
                if isInputValid {
                    Text("\(numberOfCharacters)")
                }
                
                Spacer(minLength: 25)
            }
            
            if isInputValid {
                Button(action: registerUser) {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
        }
    }
    
    private func updateInputState() {
        if !name.isEmpty && name.count <= 15 {
            isInputValid = true
        } else {
            isInputValid = false
        }
    }
    
    private func registerUser() {
        user.name = name
        user.isRegister.toggle()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
