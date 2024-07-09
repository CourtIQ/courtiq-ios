import SwiftUI

// MARK: - RDTabBarItem
@available(iOS 13.0, *)
public struct RDTabBarItem {
    let id = UUID().uuidString
    let title: String
    let icon: Image
    var badgeType: RDNotificationBadgeType?
    var notiCount: Int?
    
    public init(
        title: String,
        icon: Image,
        badgeType: RDNotificationBadgeType? = nil,
        notiCount: Int? = nil
    ) {
        self.title = title
        self.icon = icon
        self.badgeType = badgeType
        self.notiCount = notiCount
    }
    
    public func getXOffset() -> CGFloat {
        if badgeType == .small {
            return 6
        } else {
            switch notiCount ?? 0 {
            case ..<10:
                return 10
            case 10...99:
                return 12
            case 100...:
                return 24
            default:
                return 6
            }
        }
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
        .padding(.top, 6)
        .border(width: 1, edges: [.top], color: Color.platinum200)
        .frame(height: 64)
    }
    
    // MARK: - TabItem
    func TabItem(item: RDTabBarItem, isSelected: Bool, action: @escaping () -> ()) -> some View {
        VStack(spacing: 8) {
            ZStack {
                item.icon
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                
                if let badgeType = item.badgeType {
                    RDNotificationBadgeView(type: badgeType, notiCount: item.notiCount)
                        .offset(x: item.getXOffset(), y: -6)
                }
            }
            Text(item.title)
                .font(.system(size: 12, weight: .bold))
        }
        .foregroundColor(isSelected ? .platinum950 : .platinum400)
        .padding(.horizontal, 8)
        .onTapGesture {
            withAnimation {
                action()
            }
        }
    }
}
