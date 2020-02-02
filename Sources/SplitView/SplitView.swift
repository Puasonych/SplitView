import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
public struct SplitView<Content>: View where Content: View {
    
    // MARK: - Nested types
    
    public typealias DisplayMode = UISplitViewController.DisplayMode

    // MARK: - Parameters
    
    internal let controllers: () -> [UIViewController]
    internal let displayMode: DisplayMode
    
    public var body: some View {
        SplitViewController(controllers: controllers(), preferredDisplayMode: displayMode)
    }
    
    // MARK: - Initialization
    
    internal init(displayMode: DisplayMode = .automatic, controllers: @escaping () -> [UIViewController]) {
        self.displayMode = displayMode
        self.controllers = controllers
    }
    
    // MARK: - Methods
    
    public func displayMode(_ displayMode: DisplayMode) -> Self {
        Self(displayMode: displayMode, controllers: controllers)
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension SplitView {
    
    public init<Data, ForEachContent>(displayMode: DisplayMode = .automatic, @ViewBuilder content: @escaping () -> Content) where Content == ForEach<Data, Data.Element.ID, ForEachContent>, Data: RandomAccessCollection, Data.Element: Identifiable, ForEachContent: View {
        self.displayMode = displayMode
        self.controllers = { Self.prepare(view: content()) }
    }
    
    public init<Data, ID, ForEachContent>(displayMode: DisplayMode = .automatic, @ViewBuilder content: @escaping () -> Content) where Content == ForEach<Data, ID, ForEachContent>, Data: RandomAccessCollection, ID: Hashable, ForEachContent: View {
        self.displayMode = displayMode
        self.controllers = { Self.prepare(view: content()) }
    }
    
    public init<C0, C1>(displayMode: DisplayMode = .automatic, @ViewBuilder content: @escaping () -> Content) where Content == TupleView<(C0, C1)>, C0: View, C1: View {
        self.displayMode = displayMode
        self.controllers = { Self.prepare(view: content()) }
    }
    
    public init<C0, C1, C2>(displayMode: DisplayMode = .automatic, @ViewBuilder content: @escaping () -> Content) where Content == TupleView<(C0, C1, C2)>, C0: View, C1: View, C2: View {
        self.displayMode = displayMode
        self.controllers = { Self.prepare(view: content()) }
    }
    
    public init<C0, C1, C2, C3>(displayMode: DisplayMode = .automatic, @ViewBuilder content: @escaping () -> Content) where Content == TupleView<(C0, C1, C2, C3)>, C0: View, C1: View, C2: View, C3: View {
        self.displayMode = displayMode
        self.controllers = { Self.prepare(view: content()) }
    }
    
    public init<C0, C1, C2, C3, C4>(displayMode: DisplayMode = .automatic, @ViewBuilder content: @escaping () -> Content) where Content == TupleView<(C0, C1, C2, C3, C4)>, C0: View, C1: View, C2: View, C3: View, C4: View {
        self.displayMode = displayMode
        self.controllers = { Self.prepare(view: content()) }
    }
    
    public init<C0, C1, C2, C3, C4, C5>(displayMode: DisplayMode = .automatic, @ViewBuilder content: @escaping () -> Content) where Content == TupleView<(C0, C1, C2, C3, C4, C5)>, C0: View, C1: View, C2: View, C3: View, C4: View, C5: View {
        self.displayMode = displayMode
        self.controllers = { Self.prepare(view: content()) }
    }
    
    public init<C0, C1, C2, C3, C4, C5, C6>(displayMode: DisplayMode = .automatic, @ViewBuilder content: @escaping () -> Content) where Content == TupleView<(C0, C1, C2, C3, C4, C5, C6)>, C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View {
        self.displayMode = displayMode
        self.controllers = { Self.prepare(view: content()) }
    }
    
    public init<C0, C1, C2, C3, C4, C5, C6, C7>(displayMode: DisplayMode = .automatic, @ViewBuilder content: @escaping () -> Content) where Content == TupleView<(C0, C1, C2, C3, C4, C5, C6, C7)>, C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View {
        self.displayMode = displayMode
        self.controllers = { Self.prepare(view: content()) }
    }
    
    public init<C0, C1, C2, C3, C4, C5, C6, C7, C8>(displayMode: DisplayMode = .automatic, @ViewBuilder content: @escaping () -> Content) where Content == TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8)>, C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View {
        self.displayMode = displayMode
        self.controllers = { Self.prepare(view: content()) }
    }
    
    public init<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(displayMode: DisplayMode = .automatic, @ViewBuilder content: @escaping () -> Content) where Content == TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>, C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View {
        self.displayMode = displayMode
        self.controllers = { Self.prepare(view: content()) }
    }
    
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension SplitView {
    
    static func prepare<Content>(view: Content) -> [UIViewController] where Content: View {
        [UIHostingController(rootView: view)]
    }

    static func prepare<Data, ID, Content>(view: ForEach<Data, ID, Content>) -> [UIViewController] where Data: RandomAccessCollection, ID: Hashable, Content: View {
        view.data.flatMap { prepare(view: view.content($0)) }
    }
    
    static func prepare<Data, Content>(view: ForEach<Data, Data.Element.ID, Content>) -> [UIViewController] where Data: RandomAccessCollection, Data.Element: Identifiable, Content: View {
        view.data.flatMap { prepare(view: view.content($0)) }
    }

    static func prepare<C0, C1>(view: Content) -> [UIViewController] where Content == TupleView<(C0, C1)>, C0: View, C1: View {
        [prepare(view: view.value.0),
         prepare(view: view.value.1)].flatMap { $0 }
    }
    
    static func prepare<C0, C1, C2>(view: Content) -> [UIViewController] where Content == TupleView<(C0, C1, C2)>, C0: View, C1: View, C2: View {
        [prepare(view: view.value.0),
         prepare(view: view.value.1),
         prepare(view: view.value.2)].flatMap { $0 }
    }
    
    static func prepare<C0, C1, C2, C3>(view: Content) -> [UIViewController] where Content == TupleView<(C0, C1, C2, C3)>, C0: View, C1: View, C2: View, C3: View {
        [prepare(view: view.value.0),
         prepare(view: view.value.1),
         prepare(view: view.value.2),
         prepare(view: view.value.3)].flatMap { $0 }
    }
    
    static func prepare<C0, C1, C2, C3, C4>(view: Content) -> [UIViewController] where Content == TupleView<(C0, C1, C2, C3, C4)>, C0: View, C1: View, C2: View, C3: View, C4: View {
        [prepare(view: view.value.0),
         prepare(view: view.value.1),
         prepare(view: view.value.2),
         prepare(view: view.value.3),
         prepare(view: view.value.4)].flatMap { $0 }
    }
    
    static func prepare<C0, C1, C2, C3, C4, C5>(view: Content) -> [UIViewController] where Content == TupleView<(C0, C1, C2, C3, C4, C5)>, C0: View, C1: View, C2: View, C3: View, C4: View, C5: View {
        [prepare(view: view.value.0),
         prepare(view: view.value.1),
         prepare(view: view.value.2),
         prepare(view: view.value.3),
         prepare(view: view.value.4),
         prepare(view: view.value.5)].flatMap { $0 }
    }
    
    static func prepare<C0, C1, C2, C3, C4, C5, C6>(view: Content) -> [UIViewController] where Content == TupleView<(C0, C1, C2, C3, C4, C5, C6)>, C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View {
        [prepare(view: view.value.0),
         prepare(view: view.value.1),
         prepare(view: view.value.2),
         prepare(view: view.value.3),
         prepare(view: view.value.4),
         prepare(view: view.value.5),
         prepare(view: view.value.6)].flatMap { $0 }
    }
    
    static func prepare<C0, C1, C2, C3, C4, C5, C6, C7>(view: Content) -> [UIViewController] where Content == TupleView<(C0, C1, C2, C3, C4, C5, C6, C7)>, C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View {
        [prepare(view: view.value.0),
         prepare(view: view.value.1),
         prepare(view: view.value.2),
         prepare(view: view.value.3),
         prepare(view: view.value.4),
         prepare(view: view.value.5),
         prepare(view: view.value.6),
         prepare(view: view.value.7)].flatMap { $0 }
    }
    
    static func prepare<C0, C1, C2, C3, C4, C5, C6, C7, C8>(view: Content) -> [UIViewController] where Content == TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8)>, C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View {
        [prepare(view: view.value.0),
         prepare(view: view.value.1),
         prepare(view: view.value.2),
         prepare(view: view.value.3),
         prepare(view: view.value.4),
         prepare(view: view.value.5),
         prepare(view: view.value.6),
         prepare(view: view.value.7),
         prepare(view: view.value.8)].flatMap { $0 }
    }
    
    static func prepare<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(view: Content) -> [UIViewController] where Content == TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>, C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View {
        [prepare(view: view.value.0),
         prepare(view: view.value.1),
         prepare(view: view.value.2),
         prepare(view: view.value.3),
         prepare(view: view.value.4),
         prepare(view: view.value.5),
         prepare(view: view.value.6),
         prepare(view: view.value.7),
         prepare(view: view.value.8),
         prepare(view: view.value.9)].flatMap { $0 }
    }
    
}
