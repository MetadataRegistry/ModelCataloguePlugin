package org.modelcatalogue.core.springsecurityui

import spock.lang.Issue
import spock.lang.Narrative
import spock.lang.Specification
import spock.lang.Title

@Issue('https://metadata.atlassian.net/browse/MET-1727')
@Title('Logged in as supervisor, able to change other users role from viewer to curator via backend')
@Narrative('''
- Login to MDX as supervisor/supervisor
- Click on settings menu button from top | Drop-down menu appears
- Select Users option from drop down menu | Taken to the backend page with title 'Spring Security Management Console' with a User Search box present.
- In the form box titled 'Username' Type the name of user ( that has a User role) and press the search button. | A list appears under the User Search box with results .
- Select user X's name from the list of results | Taken to page with 'Edit User ' title. User details are shown.
- Select the tab titled 'Roles' next to 'User Details | User Roles are shown.
- Tick the option next to Role_ Metadata_Curator | Check that both role_user and role_metadata_curator are now selected
- Select the button 'Update' to update user roles | User roles are updated
- Logout and log back in as User X
- Check that User X now sees the import menu next to the admin menu in the top left corner. The admin menu should also include the option for Mapping Utility
''')
class GrantRoleCuratorSpec extends Specification {
}