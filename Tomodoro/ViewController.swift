import Cocoa

class ViewController: NSViewController {
  @IBOutlet weak var textField: NSTextField!

  override func viewDidLoad() {
    super.viewDidLoad()

    let timer = PomodoroTimer()
    timer.start() { (referenceDate, duration) in
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "mm:ss"
      let date = Date(timeInterval: TimeInterval(exactly: duration)!, since: referenceDate)
      self.textField.stringValue = dateFormatter.string(from: date)
    }
  }

  override func viewWillAppear() {
    super.viewWillAppear()
    view.window?.title = "Tomodoro"
    // Hard-coded to a timer of 25 minutes now and in this format.
    textField.stringValue = "25:00"
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }
}
