//
//  XelaChart.swift
//  XelaExampleApp
//
//  Created by Pranav Suri on 08.08.2021.
//

import SwiftUI
import RDDesignSystem

struct XelaChart: View {
    var type: XelaChartType
    var labels: [String] = .init()
    var datasetsLineChart: XelaLineDatasets? = nil
    var datasetsBarChart: XelaBarDatasets? = nil
    var datasetPieChart: XelaPieDatasets? = nil
    var datasetsDoughnutChart: XelaDoughnutDatasets? = nil

    var labelsColor: Color = Color.TokenColor.Semantic.Text.default
    var chartBorderColor: Color = Color.Token.grey50
    var pieBackgroundColor: Color = Color.Token.grey50
    var doughnutBackgroundColor: Color = .init(.white)
    var doughnutEmptyColor: Color = Color.Token.grey50

    var labelsFormat: String = "%.0f"
    var beforeLabel: String = ""
    var afterLabel: String = ""

    var body: some View {
        VStack {
            if type == .Line && datasetsLineChart != nil {
                XelaLineChartBody(type: type, labels: labels, datasets: datasetsLineChart!, labelsColor: labelsColor, chartBorderColor: chartBorderColor, labelsFormat: labelsFormat, beforeLabel: beforeLabel, afterLabel: afterLabel)
            } else if type == .Bar && datasetsBarChart != nil {
                XelaBarChartBody(type: type, labels: labels, datasets: datasetsBarChart!, labelsColor: labelsColor, chartBorderColor: chartBorderColor, labelsFormat: labelsFormat, beforeLabel: beforeLabel, afterLabel: afterLabel)
            } else if type == .Pie && datasetPieChart != nil {
                XelaPieChartBody(dataset: datasetPieChart!, background: pieBackgroundColor)
            } else if type == .Doughnut && datasetsDoughnutChart != nil {
                XelaDoughnutChartBody(datasets: datasetsDoughnutChart!, background: doughnutBackgroundColor, emptyColor: doughnutEmptyColor)
            }
        }
    }
}
