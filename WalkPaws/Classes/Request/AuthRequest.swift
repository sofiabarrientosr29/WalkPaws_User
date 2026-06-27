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
}
