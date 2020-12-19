//
//  SmokerNotesWidget.swift
//  SmokerNotesWidget
//
//  Created by Anatoliy on 19.12.2020.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct SmokerNotesWidgetEntryView : View {
    var entry: Provider.Entry
    var data = CRUD()
    var userName = UserDefaults.standard.string(forKey: "SmokerName")
    
    var body: some View {
        VStack {
            Text(userName ?? "")
        Text (data.getObjects().last?.nameTask ?? "")
        Text(data.getObjects().last?.textThoughts ?? "")
        }
    }
}

@main
struct SmokerNotesWidget: Widget {
    let kind: String = "SmokerNotesWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SmokerNotesWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct SmokerNotesWidget_Previews: PreviewProvider {
    static var previews: some View {
        SmokerNotesWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
