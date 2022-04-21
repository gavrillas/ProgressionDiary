import SwiftUI

struct DashboardItemPresentationModel {
    let image: Image
    let title: String
    let description: String
    let action: () -> Void
}

struct DashboardItemView: View {
    let presentationModel: DashboardItemPresentationModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .shadow(radius: 10)
            VStack(spacing: 10) {
                presentationModel.image
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.indigoCustom)
                Text(presentationModel.title)
                    .font(.headline)
                    .foregroundColor(.indigoCustom)
                Text(presentationModel.description)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.vertical)
            .onTapGesture {
                presentationModel.action()
            }
        }.aspectRatio(1, contentMode: .fit)
    }
}

struct DashboardItemView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardItemView(presentationModel: .init(image: .init(systemName: "person.fill"), title: "Menu", description: "Hello this is a menu item", action: {} ))
            .frame(width: 200)
    }
}
