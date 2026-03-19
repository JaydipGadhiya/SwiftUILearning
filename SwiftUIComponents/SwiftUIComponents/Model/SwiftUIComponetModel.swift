//
//  SwiftUIComponets.swift
//  SwiftUIComponents
//
//  Created by Jaydip Gadhiya on 18/03/26.
//

import Foundation

struct ComponentSection: Identifiable {
    let id = UUID()
    let title: String
    let items: [String]
}

final class SwiftUIComponetModel {
    
    static func getAll() -> [ComponentSection] {
        return [
            ComponentSection(title: "Basic Views", items: [
                "Text", "Image", "Label", "Divider", "Spacer"
            ]),
            
            ComponentSection(title: "Layout Containers", items: [
                "HStack", "VStack", "ZStack", "LazyVStack", "LazyHStack",
                "LazyVGrid", "LazyHGrid", "Grid", "GridRow"
            ]),
            
            ComponentSection(title: "List & Collection", items: [
                "List", "ForEach", "OutlineGroup", "Section"
            ]),
            
            ComponentSection(title: "Input Controls", items: [
                "Button", "Toggle", "TextField", "SecureField", "TextEditor",
                "Slider", "Stepper", "Picker", "DatePicker", "ColorPicker", "Menu"
            ]),
            
            ComponentSection(title: "Navigation", items: [
                "NavigationStack", "NavigationView", "NavigationLink", "TabView"
            ]),
            
            ComponentSection(title: "Presentation", items: [
                "Sheet", "FullScreenCover", "Popover", "Alert", "ConfirmationDialog"
            ]),
            
            ComponentSection(title: "Containers & Scroll", items: [
                "ScrollView", "ScrollViewReader", "Group", "GroupBox", "Form"
            ]),
            
            ComponentSection(title: "Shapes", items: [
                "Rectangle", "RoundedRectangle", "Circle", "Ellipse", "Capsule", "Path"
            ]),
            
            ComponentSection(title: "Media", items: [
                "VideoPlayer", "Map", "Canvas"
            ]),
            
            ComponentSection(title: "Progress & Indicators", items: [
                "ProgressView", "Gauge"
            ]),
            
            ComponentSection(title: "Charts", items: [
                "Chart", "BarMark", "LineMark", "PointMark"
            ]),
            
            ComponentSection(title: "Toolbars & Menus", items: [
                "Toolbar", "ToolbarItem", "ToolbarItemGroup", "ContextMenu", "Menu"
            ]),
            
            ComponentSection(title: "Accessibility", items: [
                "AccessibilityRotor", "AccessibilityFocusState"
            ]),
            
            ComponentSection(title: "Advanced Containers", items: [
                "GeometryReader", "ViewThatFits", "TimelineView", "DisclosureGroup"
            ]),
            
            ComponentSection(title: "State & Property Wrappers", items: [
                "@State", "@Binding", "@ObservedObject", "@StateObject",
                "@Environment", "@EnvironmentObject", "@AppStorage",
                "@SceneStorage", "@FetchRequest"
            ])
        ]
    }
}
