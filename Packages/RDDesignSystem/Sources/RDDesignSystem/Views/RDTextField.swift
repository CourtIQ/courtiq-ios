import SwiftUI

@available(iOS 13.0, *)
public enum RDTextFieldType {
    case primary
    case search
    
    var bgColor: Color {
        switch self {
        case .primary:
            return .white
        case .search:
            return .platinum50
        }
    }
    
    var focusedBgColor: Color {
        switch self {
        case .primary:
            return .white
        case .search:
            return .platinum100
        }
    }
}

public enum RDTextFieldStatus {
    case info
    case warning
    case success
    case error
    case none
    
    var icon: String {
        switch self {
        case .info:
            return "ic_Info"
        case .warning:
            return "ic_AlertTriangle"
        case .success:
            return "ic_Success"
        case .error:
            return "ic_Error"
        case .none:
            return ""
        }
    }
}

@available(iOS 13.0, *)
public struct RDTextFieldParams {
    var type: RDTextFieldType
    var placeholder: String
    var height: CGFloat
    var isBorderExists: Bool
    
    public init(
        type: RDTextFieldType = .primary,
        placeholder: String,
        height: CGFloat = 56,
        isBorderExists: Bool = true
    ) {
        self.type = type
        self.placeholder = placeholder
        self.height = height
        self.isBorderExists = isBorderExists
    }
}

@available(iOS 15.0, *)
public struct RDTextField: View {
    
    var params: RDTextFieldParams
    @Binding var text: String
    @State private var internalStatus: RDTextFieldStatus = .none
    @State private var internalErrorString: String? = nil
    var status: Binding<RDTextFieldStatus>?
    var errorString: Binding<String?>?
    var onTrailingIconPressed: (() -> ())?
    var validationType: ValidationType?
    
    @FocusState private var focused: Bool
    
    public init(
        params: RDTextFieldParams,
        text: Binding<String>,
        status: Binding<RDTextFieldStatus>? = nil,
        errorString: Binding<String?>? = nil,
        onTrailingIconPressed: (()->())? = nil,
        validationType: ValidationType? = nil
    ) {
        self.params = params
        self._text = text
        self.status = status
        self.errorString = errorString
        self.onTrailingIconPressed = onTrailingIconPressed
        self.validationType = validationType
    }
    
    private var currentStatus: Binding<RDTextFieldStatus> {
        status ?? $internalStatus
    }
    
    private var currentErrorString: Binding<String?> {
        errorString ?? $internalErrorString
    }
    
    public var body: some View {
        let isError = (params.type == .primary && currentStatus.wrappedValue == .error)
        let isActive = focused || text.count > 0
        
        VStack(alignment: .leading, spacing: 4) { // Adjusted spacing
            HStack(spacing: 8) {
                if params.type == .search {
                    Image(uiImage: UIImage(named: "ic_Search", in: .module, with: nil)!)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                
                ZStack(alignment: .leading) {
                    if params.type == .search {
                        if text.isEmpty {
                            Text(params.placeholder)
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.leading, 8)
                        }
                        
                        TextField("", text: $text)
                            .foregroundColor(.platinum950)
                            .frame(height: 24)
                            .font(.system(size: 16, weight: .regular))
                            .focused($focused)
                            .onChange(of: text, perform: { newValue in
                                validate()
                            })
                    } else {
                        TextField("", text: $text)
                            .foregroundColor(.platinum950)
                            .frame(height: 24)
                            .font(.system(size: 16, weight: .regular))
                            .placeholder(when: text.isEmpty) {
                                Text(params.placeholder)
                                    .foregroundColor(.gray)
                            }
                            .opacity(isActive ? 1 : 0)
                            .offset(y: 7)
                            .focused($focused)
                            .onChange(of: text, perform: { newValue in
                                validate()
                            })
                        
                        HStack {
                            Text(params.placeholder)
                                .foregroundColor(isError ? .red : .platinum500)
                                .frame(height: 16)
                                .font(.system(size: isActive ? 12 : 16, weight: .regular))
                                .offset(y: isActive ? -12 : 0) // Adjusted offset to move placeholder higher
                            Spacer()
                        }
                    }
                }
                .animation(.linear, value: focused)
                
                Spacer()
                
                Button {
                    onTrailingIconPressed?()
                } label: {
                    if params.type == .primary {
                        if !currentStatus.wrappedValue.icon.isEmpty {
                            Image(uiImage: UIImage(named: currentStatus.wrappedValue.icon, in: .module, with: nil)!)
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    } else {
                        Image(uiImage: UIImage(named: "ic_Microphone", in: .module, with: nil)!)
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
            }
            .frame(height: params.height)
            .padding(.horizontal, 16)
            .background(focused ? params.type.focusedBgColor : params.type.bgColor)
            .cornerRadius(12)
            .overlay {
                if params.isBorderExists {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(focused ? Color.grey400 : Color.grey200)
                }
            }
            .onTapGesture {
                focused = true
            }
            
            if let errorString = currentErrorString.wrappedValue, !errorString.isEmpty {
                Text(errorString)
                    .foregroundColor(.red)
                    .font(.system(size: 12, weight: .regular)) // Adjusted font size
                    .padding(.top, 2) // Adjusted position to be closer to the text field
            }
        }
    }
    
    private func validate() {
        guard let validationType = validationType else { return }
        let result = validationType.validator.validate(input: text)
        currentStatus.wrappedValue = result.0
        currentErrorString.wrappedValue = result.1
    }
}

@available(iOS 13.0, *)
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
    
    func placeholder(
        _ text: String,
        when shouldShow: Bool,
        alignment: Alignment = .leading
    ) -> some View {
        
        placeholder(when: shouldShow, alignment: alignment) {
            Text(text)
                .foregroundColor(.platinum500)
        }
    }
}
