//
//  ContentView.swift
//  DynamicLayersExample
//
//  Created by DynamicLayers on 16/11/2023.
//

import SwiftUI
import DynamicLayers

struct Widget {
    let id = UUID().uuidString
    let destinationView: AnyView
    let label: AnyView
}

struct ContentView: View {
    
    let widgets: [Widget] = [
        Widget(
            destinationView: AnyView(NotificationComponent()),
            label: AnyView(Text("1.  Notification"))
        ),
        Widget(
            destinationView: AnyView(AvatarComponent()),
            label: AnyView(Text("2.  Avatar"))
        ),
        Widget(
            destinationView: AnyView(BadgeComponent()),
            label: AnyView(Text("3.  Badge"))
        ),
        Widget(
            destinationView: AnyView(IconButtonComponent()),
            label: AnyView(Text("4.  Icon Button"))
        ),
        Widget(
            destinationView: AnyView(ChipComponent()),
            label: AnyView(Text("5.  Chip"))
        ),
        Widget(
            destinationView: AnyView(ButtonComponent()),
            label: AnyView(Text("6.  Button"))
        ),
        Widget(
            destinationView: AnyView(CardComponent()),
            label: AnyView(Text("7.  Card"))
        ),
        Widget(
            destinationView: AnyView(BottomNavigationBarComponent()),
            label: AnyView(Text("8.  Bottom Navigation Bar"))
        ),
        Widget(
            destinationView: AnyView(BottomSheetComponent()),
            label: AnyView(Text("9.  Bottom Sheet"))
        ),
        Widget(
            destinationView: AnyView(PageIndicatorComponent()),
            label: AnyView(Text("10.  Page Indicator"))
        ),
        Widget(
            destinationView: AnyView(CoachMarkComponent()),
            label: AnyView(Text("11.  Coach Mark"))
        ),
        Widget(
            destinationView: AnyView(CKToggleComponent()),
            label: AnyView(Text("12.  Toggle"))
        ),
        Widget(
            destinationView: AnyView(CKLineItemComponent()),
            label: AnyView(Text("13.  Line Item"))
        ),
        Widget(
            destinationView: AnyView(CKSegmentControlComponent()),
            label: AnyView(Text("14.  Segment Control"))
        ),
        Widget(
            destinationView: AnyView(CKMenuComponent()),
            label: AnyView(Text("15.  Menu"))
        ),
        Widget(
            destinationView: AnyView(CKMessageComponent()),
            label: AnyView(Text("16.  Message"))
        ),
        Widget(
            destinationView: AnyView(CKTabControlComponent()),
            label: AnyView(Text("17.  Tab Control"))
        ),
        Widget(
            destinationView: AnyView(CKNotificationBadgeComponent()),
            label: AnyView(Text("18.  Notification Badge"))
        ),
        Widget(
            destinationView: AnyView(CKTextFieldComponent()),
            label: AnyView(Text("19.  Text Field"))
        ),
        Widget(
            destinationView: AnyView(CKTopNavigationComponent()),
            label: AnyView(Text("20.  Top Navigation"))
        ),
        Widget(
            destinationView: AnyView(TooltipComponent()),
            label: AnyView(Text("21.  Tooltip"))
        )
    ]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(widgets, id: \.id) { widget in
                    NavigationLink {
                        widget.destinationView
                    } label: {
                        widget.label
                    }

                }
            }
            .navigationTitle("Dynamic Layers")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
