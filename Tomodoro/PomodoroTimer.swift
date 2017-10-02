import Foundation

class PomodoroTimer {
  private var referenceDate: Date?
  var duration: Int
  var isStarted: Bool
  var updateCallback: ((Date, Int) -> Void)?

  init() {
    self.duration = 25 * 60
    self.isStarted = false
  }

  private func createReferenceDate() -> Date {
    let calendar = Calendar.current
    var components = calendar.dateComponents([.minute, .second], from: Date())

    components.minute = 0
    components.second = 0

    guard let date = calendar.date(from: components) else {
      preconditionFailure("Invalid date created by setting minute and second to zero")
    }

    return date
  }

  func start(updateCallback: @escaping (Date, Int) -> Void) {
    referenceDate = createReferenceDate()
    self.updateCallback = updateCallback
    _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    isStarted = true
  }

  @objc func update() {
    // If we do not have a reference date this means we have not started this timer yet.
    guard let referenceDate = referenceDate else { return }
    duration -= 1
    updateCallback?(referenceDate, duration)
  }
}
