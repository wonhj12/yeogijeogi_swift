/// The possible navigation destinations from the main walk view.
///
/// This enum is used by the navigation system to identify which view to present.
enum Route: Hashable {
    /// The view for selecting a walk course.
    case walkSelect
    /// The view for the active walk session.
    case walk
    /// The view for saving a completed walk.
    case walkSave
}