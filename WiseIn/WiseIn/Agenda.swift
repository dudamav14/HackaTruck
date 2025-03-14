import SwiftUI

struct Agenda: View {
    @State private var selectedDate = Date()
    @State private var showingAddEvent = false
    @State private var events: [Event] = []
    
    var body: some View {
       
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.top)
           
            ScrollView {
                VStack {
                    
                    Text("Agenda")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                    
                    CalendarView(selectedDate: $selectedDate)
                    
                    Button("Agendar Dia") {
                        showingAddEvent = true
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    
                    Text("Eventos para \(formattedDate(selectedDate))")
                        .font(.headline)
                        .padding(.top)
                    
                    //List {
                    VStack(){
                        ForEach(events.filter { isSameDay($0.date, selectedDate) }) { event in
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                VStack(alignment: .leading) {
                                    Text(event.title).bold()
                                    Text(event.type)
                                    Text(event.date, style: .date)
                                }
                            }
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddEvent) {
            AddEvento(events: $events, selectedDate: selectedDate)
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}

#Preview {
    ContentView()
}

