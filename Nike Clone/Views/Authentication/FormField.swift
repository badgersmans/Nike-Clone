import SwiftUI

struct FormField: View {
    
    @Binding var value: String
    var icon: String
    var placeholder: String
    var isSecure: Bool = false
    var validateState: ValidationState? // Now can be nil initially
    var errorMessage: String?
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        
        let color: Color = {
            switch validateState {
            case .valid:
                return .black.opacity(0.5)
            case .invalid:
                return .red
            case .empty:
                return .red
            case nil:
                return .black.opacity(0.5) // Default color when validation state is undefined
            }
        }()
        
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
                    .foregroundStyle(color)
                    .padding(4)
                
                Group {
                    if isSecure {
                        SecureField(placeholder, text: $value)
                    } else {
                        TextField(placeholder, text: $value)
                    }
                }
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .keyboardType(keyboardType)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(color, lineWidth: 1)
            )
            
            // Show error message if validation state is invalid
            if let errorMessage = errorMessage, validateState != .valid {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }
        }
        .padding(.bottom) // VStack padding
    }
}

#Preview {
    VStack {
        FormField(value: .constant(""), icon: "envelope", placeholder: "Email", validateState: nil) // Initial state is nil
        FormField(value: .constant("hello"), icon: "key", placeholder: "Password", isSecure: true, validateState: .invalid, errorMessage: "this is an error message")
    }
}
