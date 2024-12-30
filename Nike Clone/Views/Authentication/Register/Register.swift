//
//  Register.swift
//  Nike Clone
//
//  Created by Shawn Law on 29/12/2024.
//

import SwiftUI

struct Register: View {

    @State var vm = RegisterViewModel()

    var body: some View {
        
        FormField(value: $vm.email, icon: "envelope", placeholder: "Email", isSecure: false, validateState: vm.emailValidationState, errorMessage: vm.emailErrorMessage)
        FormField(value: $vm.password, icon: "key", placeholder: "Password", isSecure: true, validateState: vm.passwordValidationState, errorMessage: vm.passwordErrorMessage)


        
        
        
    }
}

#Preview {
    Register()
}
