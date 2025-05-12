//
//  DumbLauncherWidget.swift
//  DumbLauncherWidget
//
//  Created by Cooper Baltimore on 5/12/25.
//

import WidgetKit
import SwiftUI

// Provider
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries = [SimpleEntry(date: Date())]
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct DumbLauncherWidgetEntryView : View {
    var entry: SimpleEntry  // MUST use entry passed from timeline

    var body: some View {
        VStack {
            Link("Safari", destination: URL(string: "http://www.google.com")!)
            Link("Messages", destination: URL(string: "sms://123456789")!)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("WidgetBackground"))
    }
}


@main
struct DumbLauncherWidget: Widget {
    let kind: String = "DumbLauncherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DumbLauncherWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
    }
}


struct DumbLauncherWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        DumbLauncherWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

#Preview{}
