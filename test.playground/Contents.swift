import UIKit

var date = Date()
print(date)
print(date.startOfDay)

extension Date {
    var startOfDay: Date {
        return Calendar(identifier: .gregorian).startOfDay(for: self)
    }
}
