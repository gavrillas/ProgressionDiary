import XCTest
import Combine
import SwiftyMocky
@testable import ProgressionDiary

class DashboardViewModelTest: XCTestCase {
    // MARK: - Mocks
    var state: DashboardViewState!
    var mockNavigator: DashboardNavigatorUseCaseMock!

    // MARK: - SUT
    var viewModel: DashboardViewModel<DashboardNavigatorUseCaseMock>!

    var cancellables = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        state = .init()
        mockNavigator = .init()
        viewModel = .init(with: mockNavigator, state: state)
    }

    override func tearDown() {
        state = nil
        mockNavigator = nil
        viewModel = nil
        cancellables = []

        super.tearDown()
    }

    func test_trainingDidTap_whenCalled_shouldInvokeNavigatorShowTraigning() {
        // When
        viewModel.trainingDidTap()

        //Expect
        Verify(mockNavigator, 1, .showTraining())
    }

    func test_profieDidTap_whenCalled_shouldInvokeNavigatorShowProfile() {
        // When
        viewModel.profileDidTap()

        // Expect
        Verify(mockNavigator, 1, .showProfile())
    }

    func test_trainingDiaryDidTap_whenCalled_shouldInvokeNavigatorShowTrainingDiary() {
        // When
        viewModel.traingingDiaryDidTap()

        //Expect
        Verify(mockNavigator, 1, .showTrainingDiary())
    }

    func test_foodDiaryDidTap_whenCalled_shouldInvokeNavigatorShowFoodDiary() {
        // When
        viewModel.foodDiaryDidTap()

        // Expect
        Verify(mockNavigator, 1, .showFoodDiary())
    }

    func test_photoDiaryDidTap_whenCalled_shouldInvokeNavigatorShowPhotoDiary() {
        // When
        viewModel.photoDiaryDidTap()

        // Expect
        Verify(mockNavigator, 1, .showPhotoDiary())
    }

    func test_vitaminsDidTap_whenCalled_shouldInvokeNavigatorShowVitamins() {
        // When
        viewModel.vitaminsDidTap()

        // Expect
        Verify(mockNavigator, 1, .showVitamins())
    }

    func test_exerciseDidTap_whenCalled_shouldInvokeNavigatorShowExercise() {
        // When
        viewModel.exerciseDidTap()

        // Expect
        Verify(mockNavigator, 1, .showExercise())
    }
}
