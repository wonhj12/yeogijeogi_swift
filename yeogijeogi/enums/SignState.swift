/// The authentication state of the user.
///
/// This enum is used to determine whether the user is currently signed in or not.
enum SignState {
    /// The user is signed in.
    case signIn
    /// The user is signed out.
    case signOut
}