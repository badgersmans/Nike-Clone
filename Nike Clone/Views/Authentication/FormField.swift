//
//  FormField.swift
//  Nike Clone
//
//  Created by Shawn Law on 29/12/2024.
//

import SwiftUI

struct FormField: View {
    
    @Binding var value: String
    var icon: String
    var placeholder: String
    var isSecure: Bool = false
    var validateState: ValidateState
    var errorMessage: String?
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        
        let shadowColor: Color = {
            switch validateState {
            case .valid:
                return .black.opacity(0.5)
            case .invalid:
                return .red
            case .empty:
                return .black.opacity(0.5)
            }
        }()
        
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
                    .foregroundStyle(shadowColor)
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
                    .stroke(shadowColor, lineWidth: 1)
            )
            
            // Show error message if validation state is invalid
            if validateState == .invalid {
                Text(errorMessage!)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }
        }
        .padding(.bottom) //VStack padding
    }
}

#Preview {
    VStack {
        FormField(value: .constant("hello"), icon: "envelope", placeholder: "Email", validateState: .valid)
        FormField(value: .constant("hello"), icon: "key", placeholder: "Password", isSecure: true, validateState: .invalid, errorMessage: "this is an error message")
    }
}

struct EntryField: View {
    var sfSymbolName: String
    var placeHolder: String
    var prompt: String
    @Binding var field: String
    var isSecure:Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: sfSymbolName)
                    .foregroundColor(.gray)
                    .font(.headline)
                if isSecure {
                    SecureField(placeHolder, text: $field).autocapitalization(.none)
                } else {
                    
                    TextField(placeHolder, text: $field).autocapitalization(.none)
                }
            }
            .padding(8)
            .background(Color(UIColor.secondarySystemBackground))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            Text(prompt)
            .fixedSize(horizontal: false, vertical: true)
            .font(.caption)
        }
    }
}
