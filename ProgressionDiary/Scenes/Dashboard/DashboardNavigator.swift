import SwiftUI
import Combine
import Resolver

// sourcery: AutoMockable
// sourcery: typealias = "DestinationType = DashboardNavigator.NavigationState"
// sourcery: typealias = "Destination = EmptyView"
protocol DashboardNavigatorUseCase: Navigator {
    func showTraining()
    func showProfile()
    func showTrainingDiary()
    func showFoodDiary()
    func showPhotoDiary()
    func showVitamins()
    func showExercise()
}

class DashboardNavigator: DashboardNavigatorUseCase {
    private var cancellables = Set<AnyCancellable>()

    var models: [NavigationState : Any] = [:]

    /// Destinations where the navigator can navigate.
    enum NavigationState: CaseIterable {
        case training
        case profile
        case trainingDiary
        case foodDiary
        case photoDiary
        case vitamins
        case exercise
    }

    /// When it changes navigation happens.
    @Published var state: NavigationState?

    /// The destination where the navigation happens.
    var destination: some View {
        switch state {
        case .profile:
            // After the `navigate(to state:, model:)` is called
            // `inject()` will return the model which represents the sate of the view.
            // let viewState: ExampleState = inject() ?? .init()
            // ExampleView<ExampleViewModel, ExampleNavigator>(with: Resolver.resolve(args: viewState))
            let viewState: ProfileViewState = inject() ?? .init()
            ProfileView<ProfileViewModel>(viewModel: Resolver.resolve(args: viewState))
        default:
            EmptyView()
        }
    }

    func showTraining() {

    }

    func showProfile() {
        // Init viewState, update it with passed parameter and invoke navigate
        let viewState = ProfileViewState()
        // viewState.text = text

        navigate(to: .profile, model: viewState)
    }

    func showTrainingDiary() {

    }

    func showFoodDiary() {

    }

    func showPhotoDiary() {

    }

    func showVitamins() {

    }

    func showExercise() {

    }
}
