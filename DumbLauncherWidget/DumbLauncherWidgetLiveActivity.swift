//
//  DumbLauncherWidgetLiveActivity.swift
//  DumbLauncherWidget
//
//  Created by Cooper Baltimore on 5/12/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct DumbLauncherWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct DumbLauncherWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DumbLauncherWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension DumbLauncherWidgetAttributes {
    fileprivate static var preview: DumbLauncherWidgetAttributes {
        DumbLauncherWidgetAttributes(name: "World")
    }
}

extension DumbLauncherWidgetAttributes.ContentState {
    fileprivate static var smiley: DumbLauncherWidgetAttributes.ContentState {
        DumbLauncherWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: DumbLauncherWidgetAttributes.ContentState {
         DumbLauncherWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: DumbLauncherWidgetAttributes.preview) {
   DumbLauncherWidgetLiveActivity()
} contentStates: {
    DumbLauncherWidgetAttributes.ContentState.smiley
    DumbLauncherWidgetAttributes.ContentState.starEyes
}
