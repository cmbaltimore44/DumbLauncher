//
//  DumbLauncherWidgetBundle.swift
//  DumbLauncherWidget
//
//  Created by Cooper Baltimore on 5/12/25.
//

import WidgetKit
import SwiftUI

@main
struct DumbLauncherWidgetBundle: WidgetBundle {
    var body: some Widget {
        DumbLauncherWidget()
        DumbLauncherWidgetControl()
        DumbLauncherWidgetLiveActivity()
    }
}
