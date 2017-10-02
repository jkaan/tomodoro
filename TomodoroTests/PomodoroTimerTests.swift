import XCTest
@testable import Tomodoro

class PomodoroTimerTests: XCTestCase {
  func testCanCreateTimerWithSetDuration() {
    let timer = PomodoroTimer()
    XCTAssert(timer.duration == 25 * 60)
  }

  func testCanStartTimer() {
    let timer = PomodoroTimer()
    timer.start(updateCallback: { _,_  in })
    XCTAssertTrue(timer.isStarted)
  }
}
