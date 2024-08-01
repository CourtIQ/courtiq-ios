//
//  RDSegmentControl.swift
//
//
//  Created by Pranav Suri on 06/12/2024.
//

import SwiftUI

// MARK: - RDSegmentControl

@available(iOS 13.0, *)
public struct RDSegmentControl<Data, Content>: View where Data: Hashable, Content: View {
    public let sources: [Data]
    public let selection: Data?
    private let itemBuilder: (Data) -> Content
    
    @State private var backgroundColor: Color = Color.Token.platinum950
    
    func pickerBackgroundColor(_ color: Color) -> RDSegmentControl {
        var view = self
        view._backgroundColor = State(initialValue: color)
        return view
    }
    
    @State private var cornerRadius: CGFloat?
    
    func cornerRadius(_ cornerRadius: CGFloat) -> RDSegmentControl {
        var view = self
        view._cornerRadius = State(initialValue: cornerRadius)
        return view
    }
    
    @State private var borderColor: Color?
    
    func borderColor(_ borderColor: Color) -> RDSegmentControl {
        var view = self
        view._borderColor = State(initialValue: borderColor)
        return view
    }
    
    @State private var borderWidth: CGFloat?
    
    func borderWidth(_ borderWidth: CGFloat) -> RDSegmentControl {
        var view = self
        view._borderWidth = State(initialValue: borderWidth)
        return view
    }
        
    public init(
        _ sources: [Data],
        selection: Data?,
        @ViewBuilder itemBuilder: @escaping (Data) -> Content
    ) {
        self.sources = sources
        self.selection = selection
        self.itemBuilder = itemBuilder
    }
    
    public var body: some View {
        ZStack(alignment: .center) {
            if let selection = selection, let selectedIdx = sources.firstIndex(of: selection) {
                GeometryReader { geo in
                    RoundedRectangle(cornerRadius: cornerRadius ?? 6.0)
                        .foregroundColor(.white)
                        .cornerRadius(6.0)
                        .padding(4)
                        .frame(width: geo.size.width / CGFloat(sources.count))
                        .shadow(color: .black.opacity(0.1), radius: 2, x: 1, y: 1)
                        .offset(x: geo.size.width / CGFloat(sources.count) * CGFloat(selectedIdx), y: 0)
                }
                .frame(height: 40)
            }
            
            HStack(spacing: 0) {
                ForEach(sources, id: \.self) { item in
                    itemBuilder(item)
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: cornerRadius ?? 6.0)
                .fill(
                    backgroundColor,
                    strokeBorder: borderColor ?? Color.clear,
                    lineWidth: borderWidth ?? .zero
                )
        )
    }
}
