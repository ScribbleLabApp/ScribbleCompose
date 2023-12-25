//
//  CChatView.swift
//  ScribbleCompose (AI Lab)
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import SwiftUI

struct CFChatView: View {
    @StateObject var viewModel = CFChatViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .trailing, spacing: 10) {
                    ForEach(viewModel.chatHistory.indices, id: \.self) { index in
                        let message = viewModel.chatHistory[index]
                        let isUser = index % 2 == 0
                        
                        CFMessageBubbleView(message: message, isUser: isUser)
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            VStack {
                Divider()
                
                HStack {
                    TextField("Type a message...", text: $viewModel.userMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button {
                        viewModel.chatHistory.append(viewModel.userMessage)
                        viewModel.userMessage = ""
                        viewModel.chatHistory.append("GPT response for: \(viewModel.userMessage)")
                    } label: {
                        HStack(spacing: 5) {
                            Text("Send")
                            Image(systemName: "paperplane.fill")
                        }
                        .foregroundStyle(Color.white)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color.blue)
                        }
                    }
                }
            }
            .background(Color(.systemGray))
        }
    }
}

#Preview {
    CFChatView()
}
