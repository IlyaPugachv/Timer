import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        Group {
            if user.isRegister {
                TimerView()
            } else {
                RegisterView()
            }
        }
    }
}

#Preview {
    StarterView()
        .environmentObject(UserManager())
}
