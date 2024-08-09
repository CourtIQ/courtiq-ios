//
//  XelaPieDatasets.swift
//  XelaExampleApp
//
//  Created by Pranav Suri on 09.08.2021.
//

import SwiftUI
class XelaPieDatasets: ObservableObject {
    @Published var dataset: XelaPieChartDataset
    @Published var sum: CGFloat
    @Published var startDegrees: [Double] = .init()
    @Published var endDegrees: [Double] = .init()

    init(dataset: XelaPieChartDataset, total: CGFloat? = nil) {
        self.dataset = dataset

        if total != nil {
            sum = total!
        } else {
            sum = 0
            for data in dataset.data {
                sum += data
            }
        }

        var tempEndDegrees: Double = -90
        for data in dataset.data {
            let temp = Double(data * 360 / sum)
            startDegrees.append(tempEndDegrees)
            endDegrees.append(tempEndDegrees + temp)

            tempEndDegrees += temp
        }
    }
}
