//
//  ProfileModel.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 22/6/26.
//

import Foundation
import Supabase

struct ProfileModel: Encodable
{
    let id: UUID
    let first_name: String
    let last_name: String
    let email: String
    let phone: String?
    let role: String
}
