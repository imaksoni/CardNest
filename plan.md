1. **Business Onboarding Screen Update:**
   - Update `onboarding_screen.dart` to use the new `BusinessOnboardingScreen` for business users instead of the placeholder text.
2. **Business Dashboard:**
   - Modify `dashboard_screen.dart` to fetch dashboard data from the `BusinessRepository` and `LocalRepository`.
   - Add overview cards (e.g., total members, active programs).
   - Add a list of recent members or recent activity logs.
   - Implement quick actions (e.g., Scan QR, Manage Programs).
   - Show cached local DB data when offline.
3. **Business Profile Screen:**
   - Create a `business_profile_screen.dart` under `business_profile/`.
   - Add the screen to the router.
   - It will display the current business details and allow logging out.
   - The dashboard will have a link to this profile screen.
4. **Role-Specific Navigation:**
   - Ensure the GoRouter correctly limits access based on user role and has a bottom navigation bar or drawer for Business mode (Dashboard, Programs, Members, Profile).
   - We will use a `ShellRoute` in GoRouter to provide a persistent bottom navigation bar for the business role.
5. **Pre-commit Steps:**
   - Ensure proper testing, verification, review, and reflection are done by calling `pre_commit_instructions` and addressing them.
