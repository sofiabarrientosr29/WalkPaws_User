//
//  SupabaseManager.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 26/6/26.
//

import Foundation
import Supabase

final class SupabaseManager
{
    static let shared = SupabaseManager()
    
    let client: SupabaseClient
    
    private init()
    {
        client = SupabaseClient(
            supabaseURL: URL(string: "https://oyrhazrswpfivdzbavkz.supabase.co")!,
            supabaseKey: "sb_publishable_OZoEpqGCbBz3C0gDxA7_yg_KctQzPUQ",
            options: SupabaseClientOptions(
                auth: .init(
                    emitLocalSessionAsInitialSession: true
                )
            )
        )
    }
}
