import Foundation
import Combine

protocol DashboardViewModelUseCase {
    associatedtype N: DashboardNavigatorUseCase
    var state: DashboardViewState { get }
    var navigator: N { get }
}

class DashboardViewModel<N: DashboardNavigatorUseCase>: DashboardViewModelUseCase {
    let state: DashboardViewState
    let navigator: N

    private var subscriptions = Set<AnyCancellable>()

    init(with navigator: N, state: DashboardViewState) {
        self.navigator = navigator
        self.state = state
        
        populateDashboard()
    }

    func profileDidTap() {
        navigator.showProfile()
    }

    func diaryDidTap() {

    }

    private func populateDashboard() {
        state.dashboardItems = [
            .init(image: .init(systemName: "play.fill"), title: "Edzés", description: "Kezd el az edzést", action: {}),
            .init(image: .init(systemName: "person.fill"), title: "Profil", description: "Szerkeszd a profilod", action: profileDidTap),
            .init(image: .init(systemName: "calendar"), title: "Edzés napló", description: "Vezesd edzés naplódat", action: diaryDidTap),
            .init(image: .init(systemName: "note.text"), title: "Étkezési napló", description: "Vezesd a saját táplálkozási naplódat", action: diaryDidTap),
            .init(image: .init(systemName: "camera"), title: "Fénykép napló", description: "Dokumentáld fejlődésed fényképekkel", action: diaryDidTap),
            .init(image: .init(systemName: "pills.fill"), title: "Vitaminok", description: "Emlékeztesd magad a vitamin bevitelre", action: diaryDidTap),
            .init(image: .init(systemName: "figure.walk"), title: "Gyakorlatok", description: "Adj hozzá új gyakorlatot", action: diaryDidTap),
        ]
    }
}
