import SwiftUI

// MARK: - RDTabBarItem
@available(iOS 13.0, *)
public struct RDTabBarItem {
    let id = UUID().uuidString
    let title: String
    let icon: Image

    public init(
        title: String,
        icon: Image
    ) {
        self.title = title
        self.icon = icon
    }
}

// MARK: - RDTabBar
@available(iOS 15.0, *)
public struct RDTabBar: View {
    
    let items: [RDTabBarItem]
    @Binding var selectedIndex: Int
    
    public init(items: [RDTabBarItem], selectedIndex: Binding<Int>) {
        self.items = items
        self._selectedIndex = selectedIndex
    }
    
    public var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: items.count)) {
            ForEach(items.indices, id: \.self) { index in
                TabItem(item: items[index], isSelected: selectedIndex == index) {
                    selectedIndex = index
                }
            }
        }
        .padding(.horizontal, 6)
        .background(Color.TokenColor.Semantic.Background.default)
        .border(width: 1, edges: [.top], color: Color.TokenColor.Semantic.Border.default)
        .animation(.default, value: selectedIndex) // Apply default animation to selection changes
    }
    
    // MARK: - TabItem
    func TabItem(item: RDTabBarItem, isSelected: Bool, action: @escaping () -> ()) -> some View {
        Group {
            if isSelected {
                VStack(alignment: .center, spacing: 4) {
                    VStack(alignment: .center, spacing: 2) {
                        item.icon
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color.TokenColor.Semantic.Icon.primary)
                        Text(item.title)
                            .rdCaption()
                            .foregroundColor(Color.TokenColor.Semantic.Text.primary)
                    }
                    .padding(.horizontal, 8)
                    
                    Circle()
                        .fill(Color.TokenColor.Semantic.Background.primary)
                        .frame(width: 4, height: 4)
                        .padding(.bottom, 4)
                }
                .padding(.top, 8)
            } else {
                VStack(alignment: .center) {
                    item.icon
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.TokenColor.Semantic.Icon.secondary)
                }
                .onTapGesture {
                    action() // No need for explicit withAnimation, it's handled by the parent view
                }
            }
        }
    }
}
