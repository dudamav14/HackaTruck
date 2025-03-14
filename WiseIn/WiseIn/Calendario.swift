import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                ForEach(getCurrentMonthDays(), id: \.self) { day in
                    Text("\(day)")
                        .frame(width: 40, height: 40)
                        .background(isSelected(day) ? Color.red.opacity(0.7) : Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .onTapGesture {
                            selectDay(day)
                        }
                }
            }
            .padding()
        }
    }
    
    func getCurrentMonthDays() -> [Int] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: selectedDate)!
        return Array(range)
    }
    
    func isSelected(_ day: Int) -> Bool {
        let calendar = Calendar.current
        return calendar.component(.day, from: selectedDate) == day
    }
    
    func selectDay(_ day: Int) {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: selectedDate)
        components.day = day
        if let newDate = calendar.date(from: components) {
            selectedDate = newDate
        }
    }
}

#Preview {
    CalendarView(selectedDate: .constant(Date()))
}

