import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
public struct SplitView<Content: View>: View {
    
    let content: () -> Content
    public let preferredDisplayMode: UISplitViewController.DisplayMode
    
    public init(preferredDisplayMode: UISplitViewController.DisplayMode = .automatic, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.preferredDisplayMode = preferredDisplayMode
    }
    
    public var body: some View {
        SplitViewController(controllers: SplitView.buildControllers(content()), preferredDisplayMode: preferredDisplayMode)
    }
    
    public func preferredDisplayMode(_ preferredDisplayMode: UISplitViewController.DisplayMode) -> Self {
        Self(preferredDisplayMode: preferredDisplayMode, content: content)
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension SplitView {

    static func prepareView<Content: View>(_ content: Content) -> [UIViewController] {
        [UIHostingController(rootView: content)]
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension SplitView {

    static func prepareView<Data, ID, Content: View>(_ forEachView: ForEach<Data, ID, Content>) -> [UIViewController] {
        forEachView.data.flatMap { prepareView(forEachView.content($0)) }
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension SplitView {

    static func buildControllers<C0: View>(_ view: C0) -> [UIViewController] {
        prepareView(view)
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension SplitView {

    static func buildControllers<C0: View, C1: View>(_ views: TupleView<(C0, C1)>) -> [UIViewController] {
        [prepareView(views.value.0), prepareView(views.value.1)].flatMap { $0 }
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension SplitView {

    static func buildControllers<C0: View, C1: View, C2: View>(_ views: TupleView<(C0, C1, C2)>) -> [UIViewController] {
        [prepareView(views.value.0), prepareView(views.value.1), prepareView(views.value.2)].flatMap { $0 }
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension SplitView {

    static func buildControllers<C0: View, C1: View, C2: View, C3: View>(_ views: TupleView<(C0, C1, C2, C3)>) -> [UIViewController] {
        [prepareView(views.value.0),
         prepareView(views.value.1),
         prepareView(views.value.2),
         prepareView(views.value.3)].flatMap { $0 }
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension SplitView {

    static func buildControllers<C0: View, C1: View, C2: View, C3: View, C4: View>(_ views: TupleView<(C0, C1, C2, C3, C4)>) -> [UIViewController] {
        [prepareView(views.value.0),
         prepareView(views.value.1),
         prepareView(views.value.2),
         prepareView(views.value.3)].flatMap { $0 }
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension SplitView {

    static func buildControllers<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View>(_ views: TupleView<(C0, C1, C2, C3, C4, C5)>) -> [UIViewController] {
        [prepareView(views.value.0),
         prepareView(views.value.1),
         prepareView(views.value.2),
         prepareView(views.value.3),
         prepareView(views.value.4)].flatMap { $0 }
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension SplitView {

    static func buildControllers<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View>(_ views: TupleView<(C0, C1, C2, C3, C4, C5, C6)>) -> [UIViewController] {
        [prepareView(views.value.0),
         prepareView(views.value.1),
         prepareView(views.value.2),
         prepareView(views.value.3),
         prepareView(views.value.4),
         prepareView(views.value.5)].flatMap { $0 }
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension SplitView {

    static func buildControllers<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View>(_ views: TupleView<(C0, C1, C2, C3, C4, C5, C6, C7)>) -> [UIViewController] {
        [prepareView(views.value.0),
         prepareView(views.value.1),
         prepareView(views.value.2),
         prepareView(views.value.3),
         prepareView(views.value.4),
         prepareView(views.value.5),
         prepareView(views.value.6)].flatMap { $0 }
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension SplitView {

    static func buildControllers<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View>(_ views: TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8)>) -> [UIViewController] {
        [prepareView(views.value.0),
         prepareView(views.value.1),
         prepareView(views.value.2),
         prepareView(views.value.3),
         prepareView(views.value.4),
         prepareView(views.value.5),
         prepareView(views.value.6),
         prepareView(views.value.7)].flatMap { $0 }
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension SplitView {

    static func buildControllers<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View>(_ views: TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>) -> [UIViewController] {
        [prepareView(views.value.0),
         prepareView(views.value.1),
         prepareView(views.value.2),
         prepareView(views.value.3),
         prepareView(views.value.4),
         prepareView(views.value.5),
         prepareView(views.value.6),
         prepareView(views.value.7),
         prepareView(views.value.8)].flatMap { $0 }
    }
}
