//
//  AuthRequest.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 27/6/26.
//

import Foundation
import Supabase

class AuthRequest
{
    static let shared = AuthRequest()
    
    func register(firstName: String, lastName: String, email: String, phone: String, password: String) async throws
    {
        try await SupabaseManager.shared.client.auth.signUp(
            email: email,
            password: password,
            data: [
                "first_name": .string(firstName),
                "last_name": .string(lastName),
                "phone": .string(phone)
            ]
        )
    }
    
    func login(email: String, password: String) async throws
    {
        try await SupabaseManager.shared.client.auth.signIn(email: email, password: password)
    }
    
    func sendRecoveryCode(email: String) async throws
    {
        try await SupabaseManager.shared.client.functions.invoke("send-recovery-code", options: FunctionInvokeOptions( body: ["email": email.lowercased()]))
    }
    
    func verifyRecoveryCode(email: String, code: String) async throws
    {
        try await SupabaseManager.shared.client.functions.invoke("verify-recovery-code", options: FunctionInvokeOptions(
            body: [
                "email": email.lowercased(),
                "code": code
            ])
        )
    }
    
    func changePassword(email: String, newPassword: String) async throws
    {
        try await SupabaseManager.shared.client.functions.invoke("change-password", options: FunctionInvokeOptions(
            body: [
                "email": email.lowercased(),
                "password": newPassword
            ])
        )
    }
}
