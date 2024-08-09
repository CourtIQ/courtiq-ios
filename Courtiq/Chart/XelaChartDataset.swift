//
//  XelaChartDataset.swift
//  XelaExampleApp
//
//  Created by Pranav Suri on 08.08.2021.
//

import SwiftUI
struct XelaLineChartDataset: Hashable {
    var label: String
    var data: [CGFloat]
    var borderColor: Color = Color.Token.grey50
    var pointColor: Color = Color.Token.grey50
    var fillColor: Color = .clear
    var tension: CGFloat = 0.1
}

struct XelaBarChartDataset: Hashable {
    var label: String
    var data: [CGFloat]
    var fillColor: Color = .blue
}

struct XelaPieChartDataset: Hashable {
    var label: String
    var data: [CGFloat]
    var fillColors: [Color]
}

struct XelaDoughnutChartDataset: Hashable {
    var label: String
    var data: [CGFloat]
    var fillColors: [Color]
}
