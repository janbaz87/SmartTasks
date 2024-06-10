//
//  TasksListPresenterTests.swift
//  SmartTasksTests
//
//  Created by Janbaz Ali on 10/06/2024.
//

import XCTest
@testable import SmartTasks


final class TasksListPresenterTests: XCTestCase {

    // MARK: - Tests

    // Happy path: viewDidLoad
    func testViewDidLoad() {
        // Given
        let interactor = TasksListInteractorStub()
        let sut = makeSUT(interactor: interactor)

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertTrue(interactor.fetchTasksListCalled)
    }

    func testViewDidLoad_WithNoTasks() {
        // Given
        let interactor = TasksListInteractorStub()
        let view = TasksListViewSpy()
        let sut = makeSUT(interactor: interactor)
        interactor.output = sut
        sut.view = view

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertTrue(view.showEmptyViewCalled)
        XCTAssertTrue(view.removeTasksListDataCalled)
        XCTAssertFalse(view.setTasksListDataCalled)
    }

    func testViewDidLoad_WithTasks() {
        // Given
        let interactor = TasksListInteractorWithDataStub()
        let view = TasksListViewSpy()
        let sut = makeSUT(interactor: interactor)
        interactor.output = sut
        sut.view = view

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertFalse(view.showEmptyViewCalled)
        XCTAssertTrue(view.setTasksListDataCalled)
    }

    // Happy path: nextButtonTapped with future dates available
    func testNextButtonTapped_WithFutureDateTask() {
        // Given
        let interactor = TasksListInteractorWithDataStub()
        let view = TasksListViewSpy()
        let sut = makeSUT(interactor: interactor)
        interactor.output = sut
        sut.view = view

        // When
        sut.viewDidLoad()
        sut.nextButtonTapped()

        // Then
        XCTAssertTrue(view.setTitleCalled)
        XCTAssertEqual(view.setTitleCount, 2)
        XCTAssertTrue(view.setTasksListDataCalled)
        XCTAssertEqual(view.setTasksListDataCalledCount, 2)
        XCTAssertFalse(view.showEmptyViewCalled)

        // When
        sut.nextButtonTapped()
        XCTAssertEqual(view.setTitleCount, 2)
        XCTAssertEqual(view.setTasksListDataCalledCount, 2)
        XCTAssertFalse(view.showEmptyViewCalled)
    }

    func testPreviousButtonTapped_WithFutureDateTask() {
        // Given
        let interactor = TasksListInteractorWithDataStub()
        let view = TasksListViewSpy()
        let sut = makeSUT(interactor: interactor)
        interactor.output = sut
        sut.view = view

        // When
        sut.viewDidLoad()
        sut.previousButtonTapped()

        // Then
        XCTAssertTrue(view.setTitleCalled)
        XCTAssertEqual(view.setTitleCount, 1)
        XCTAssertTrue(view.setTasksListDataCalled)
        XCTAssertEqual(view.setTasksListDataCalledCount, 1)
        XCTAssertFalse(view.showEmptyViewCalled)

        // When
        sut.nextButtonTapped()
        sut.previousButtonTapped()

        // Then
        XCTAssertTrue(view.setTitleCalled)
        XCTAssertEqual(view.setTitleCount, 3)
        XCTAssertTrue(view.setTasksListDataCalled)
        XCTAssertEqual(view.setTasksListDataCalledCount, 3)
        XCTAssertFalse(view.showEmptyViewCalled)

        // When
        sut.previousButtonTapped()
        XCTAssertEqual(view.setTitleCount, 3)
        XCTAssertEqual(view.setTasksListDataCalledCount, 3)
        XCTAssertFalse(view.showEmptyViewCalled)
    }

    // Helpers
    private func makeSUT(
        interactor: TasksListInteractorInputing = TasksListInteractorStub(),
        router: TasksListRouting = TasksListRouter()
    ) -> TasksListPresenter {
        let sut = TasksListPresenter(
            interactor: interactor,
            router: router
        )

        return sut
    }

}
