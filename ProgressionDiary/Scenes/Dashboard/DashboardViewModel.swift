import Foundation
import Combine

protocol DashboardViewModelUseCase {
    associatedtype N: DashboardNavigatorUseCase
    var state: DashboardViewState { get }
    var navigator: N { get }

    func trainingDidTap()
    func profileDidTap()
    func traingingDiaryDidTap()
    func foodDiaryDidTap()
    func photoDiaryDidTap()
    func vitaminsDidTap()
    func exerciseDidTap()
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

    func trainingDidTap() {

    }

    func profileDidTap() {
        navigator.showProfile()
    }

    func traingingDiaryDidTap() {

    }

    func foodDiaryDidTap() {

    }

    func photoDiaryDidTap() {

    }

    func vitaminsDidTap() {
        
    }

    func exerciseDidTap() {

    }


    private func populateDashboard() {
        state.dashboardItems = [
            .init(image: .init(systemName: "play.fill"),
                  title: Txt.Dashboard.Training.title,
                  description: Txt.Dashboard.Training.description,
                  action: trainingDidTap),
            .init(image: .init(systemName: "person.fill"),
                  title: Txt.Dashboard.Profil.title,
                  description: Txt.Dashboard.Profil.description,
                  action: profileDidTap),
            .init(image: .init(systemName: "calendar"),
                  title: Txt.Dashboard.TrainingDiary.title,
                  description: Txt.Dashboard.TrainingDiary.description,
                  action: traingingDiaryDidTap),
            .init(image: .init(systemName: "note.text"),
                  title: Txt.Dashboard.FoodDiary.title,
                  description: Txt.Dashboard.FoodDiary.description,
                  action: foodDiaryDidTap),
            .init(image: .init(systemName: "camera"),
                  title: Txt.Dashboard.PhotoDiary.title,
                  description: Txt.Dashboard.PhotoDiary.description,
                  action: photoDiaryDidTap),
            .init(image: .init(systemName: "pills.fill"),
                  title: Txt.Dashboard.Vitamins.title,
                  description: Txt.Dashboard.Vitamins.description,
                  action: vitaminsDidTap),
            .init(image: .init(systemName: "figure.walk"),
                  title: Txt.Dashboard.Exercise.title,
                  description: Txt.Dashboard.Exercise.description,
                  action: exerciseDidTap),
        ]
    }
}
