//
//  File.swift
//  
//
//  Created by Nevio Hirani on 22.12.23.
//

import Foundation

public class CFChatViewModel: ObservableObject {
    @Published var userMessage: String = ""
    @Published var chatHistory: [String] = []
}
