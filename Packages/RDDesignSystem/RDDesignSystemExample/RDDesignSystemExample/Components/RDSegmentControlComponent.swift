//
//  RDSegmentControlComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 11/11/2023.
//

import SwiftUI
import RDDesignSystem

struct RDSegmentControlComponent: View {
    
    @State private var selectedItem1 : Vehicles? = .car
    @State private var selectedItem2 : Vehicles? = .car
    @State private var selectedItem3 : Vehicles? = .car
    @State private var selectedItem4 : Vehicles? = .car
    
    enum Vehicles: String, CaseIterable {
        case car = "Car"
        case bus = "Bus"
        case bike = "Bike"
        case airplane = "Airplane"
        
        var icon: String {
            switch self{
            case .car:
                return "car.fill"
            case .bus:
                return "bus"
            case .bike:
                return "bicycle"
            case .airplane:
                return "airplane"
            }
        }
        
        static var smallVehicals: [Vehicles] {
            return [.car, .bike]
        }
        
        static var largeVehicals: [Vehicles] {
            return [.car, .bus, .airplane]
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            RDSegmentControl(
                Vehicles.smallVehicals,
                selection: selectedItem1
            ) { item in
                Text(item.rawValue)
                    .font(.system(size: 16, weight: .regular))
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.00001))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.150)) {
                            selectedItem1 = item
                        }
                    }
            }
            
            RDSegmentControl(
                Vehicles.largeVehicals,
                selection: selectedItem2
            ) { item in
                Text(item.rawValue)
                    .font(.system(size: 16, weight: .regular))
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.00001))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.150)) {
                            selectedItem2 = item
                        }
                    }
            }
            
            RDSegmentControl(
                Vehicles.allCases,
                selection: selectedItem3
            ) { item in
                Text(item.rawValue)
                    .font(.system(size: 16, weight: .regular))
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.00001))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.150)) {
                            selectedItem3 = item
                        }
                    }
            }
            
            RDSegmentControl(
                Vehicles.largeVehicals,
                selection: selectedItem4
            ) { item in
                HStack(spacing: 0) {
                    Spacer()
                    Image(systemName: item.icon)
                        .frame(width: 24, height: 24)
                        .padding(.leading, 8)
                    Text(item.rawValue)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
                .background(.gray.opacity(0.00001))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.150)) {
                        selectedItem4 = item
                    }
                }
            }
        }
        .navigationTitle("Segment Control")
        .padding()
    }
}

struct RDSegmentControlComponent_Previews: PreviewProvider {
    static var previews: some View {
        RDSegmentControlComponent()
    }
}
