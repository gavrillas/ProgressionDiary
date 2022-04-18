import SwiftUI

struct DashboardItemView: View {
    let image: Image
    let title: String
    let description: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .shadow(radius: 10)
            VStack(spacing: 10) {
                image
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.indigoCustom)
                    .padding()
                Text(title)
                Text(description)
            }.padding(.vertical)
        }
    }
}

struct DashboardItemView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardItemView(image: .init(systemName: "person.fill"), title: "Menu", description: "Hello this is a menu item")
            .frame(width: 200, height: 200, alignment: .center)
    }
}
