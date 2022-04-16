import SwiftUI

protocol SegmentOption: Hashable {
    var title: String { get }
}

struct SementedControl<T: SegmentOption>: View {
    @Binding var selectedSegment: T
    let options: [T]

    init(selectedSegment: Binding<T>, options: [T]) {
        self._selectedSegment = selectedSegment
        self.options = options

        UISegmentedControl.appearance().backgroundColor = UIColor(Color.indigoCustom)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.indigoCustom)], for: .selected)
    }

    var body: some View {
        Picker(selectedSegment.title, selection: $selectedSegment) {
            ForEach(options, id: \.self) {
                Text($0.title)
                    .tag($0)
            }
        }.pickerStyle(.segmented)
    }
}

struct SementedControl_Previews: PreviewProvider {
    enum SegmentState: SegmentOption {
        case login
        case register

        var title: String {
            switch self {
            case .login:
                return Txt.Authentication.login
            case .register:
                return Txt.Authentication.register
            }
        }
    }


    @State static var segmentState: SegmentState = .register
    static let segmentedOptions: [SegmentState] = [.login, .register]

    static var previews: some View {
        SementedControl(selectedSegment: $segmentState, options: segmentedOptions)
    }
}
