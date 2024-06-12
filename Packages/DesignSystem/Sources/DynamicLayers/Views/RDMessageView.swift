//
//  RDMessageView.swift
//  
//
//  Created by DynamicLayerson 11/11/2023.
//

import SwiftUI

@available(iOS 13.0.0, *)
public enum RDMessageType {
    case sender
    case receiver
    
    var color: Color {
        switch self {
        case .sender:
            return .platinum800
        case .receiver:
            return .platinum50
        }
    }
    
    var textColor: Color {
        switch self {
        case .sender:
            return .white
        case .receiver:
            return .platinum950
        }
    }
}

@available(iOS 13.0.0, *)
public struct RDMessage {
    let message: String
    let date: String
    let image: String
    
    public init(message: String, date: String, image: String) {
        self.message = message
        self.date = date
        self.image = image
    }
}

@available(iOS 15.0.0, *)
public struct RDMessageView: View {
    
    var type: RDMessageType
    var message: RDMessage
    
    public init(type: RDMessageType = .sender, message: RDMessage) {
        self.type = type
        self.message = message
    }
    
    public var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            
            if type == .receiver {
                RDAvatarView(rdAvatarSizing: .extraSmall, rdAvatarBadgeType: .none)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(message.message)
                    .foregroundColor(type.textColor)
                    .font(.system(size: 16, weight: .regular))
                Text(message.date)
                    .foregroundColor(.platinum500)
                    .font(.system(size: 16, weight: .regular))
            }
            .padding(16)
            .background(type.color)
            .cornerRadius(12)
            
            if type == .sender {
                RDAvatarView(rdAvatarSizing: .extraSmall, rdAvatarBadgeType: .none)
            }
            
        }
    }
}
