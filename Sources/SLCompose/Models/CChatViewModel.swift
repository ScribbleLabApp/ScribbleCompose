//
//  File.swift
//  
//
//  Created by Nevio Hirani on 22.12.23.
//

import Foundation

class CChatViewModel: ObservableObject {
    @Published var userMessage: String = ""
    @Published var chatHistory: [String] = []
}
