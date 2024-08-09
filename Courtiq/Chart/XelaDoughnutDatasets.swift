//
//  XelaDoughnutDatasets.swift
//  XelaExampleApp
//
//  Created by Pranav Suri on 10.08.2021.
//

import SwiftUI
class XelaDoughnutDatasets: ObservableObject {
    @Published var datasets: [XelaDoughnutChartDataset]
    @Published var sum: CGFloat
    @Published var startDegreeses: [[Double]] = .init()
    @Published var endDegreeses: [[Double]] = .init()

    init(datasets: [XelaDoughnutChartDataset], total: CGFloat) {
        self.datasets = datasets

        sum = total
        for i in 0 ..< datasets.count {
            let dataset = datasets[i]
            var startDegrees: [Double] = .init()
            var endDegrees: [Double] = .init()
            var tempEndDegrees: Double = -90
            for data in dataset.data {
                let temp = Double(data * 360 / sum)
                startDegrees.append(tempEndDegrees)
                endDegrees.append(tempEndDegrees + temp)

                tempEndDegrees += temp
            }

            // print(tempEndDegrees)

            startDegrees.append(tempEndDegrees)
            endDegrees.append(tempEndDegrees + 360 - tempEndDegrees)

            self.datasets[i].fillColors.append(Color.Token.grey50)

            startDegreeses.append(startDegrees)
            endDegreeses.append(endDegrees)
        }
    }
}
