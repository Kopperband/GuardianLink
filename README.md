## Synopsis:

GuardianLink is a web application built with Ruby on Rails designed to provide a free platform to connect NGO’s and non-profit clients who require assistance in the cybersecurity realm with cybersecurity volunteers who have the skills and experience to assist. The primary goal of GuardianLink is to offer a user friendly and streamlined approach to connect these two groups together.

## Wireframe Diagram Links:

https://www.figma.com/design/7Xa1qZQGTq2f7NNjbptRzS/Untitled?m=dev&node-id=0-1&t=VkR2tCQDTXd0nrfx-1

## Components and Order of Development:

1. **User Authentication**
    1. Sign up
    2. Log in
    3. Password Reset
2. **User Profiles**
    1. Edit profile
    2. Delete profile
    3. Display opposite user profiles
    4. Filter Profiles
3. **Styling and Layout**
    1. Landing Page
    2. Application wide styling:
        1. Navbar
        2. Footer
    3. Login and Registration
    4. Redirect pages
    5. Dashboard page
    6. Edit/Delete profile page

## Subtasks for Each Component

1. **User Authentication**
    1. Create and Implement registration form
    2. implement Log In form
    3. Implement Password reset functionality
2. **User Profiles**
    1. Create User database page with profile cards and contact information
    2. Create and implement profile edit/delete profile page
3. **Styling and Layout**
    1. Create a landing pages with appropriate information about the platform
    2. Creation of application wide Navbar and Footer with appropriate links and options depending on whether a user is signed in or not
    3. Creation and implementation of a redirect page to send users to proper log in or registration pages
    4. Creation of user dashboard page which shows profile cards for the opposite userbase with pertinent information
    5. Creation of a user edit page allowing the logged in user to edit basic information and to delete their account

## Acceptance Criteria

1. **User Criteria**
    - Users can register with a valid email and a password
    - Users can Log In with their credentials
    - Users can reset their password
2. **User Profiles**
    - Users can access only opposite user base profile cards
    - Users can use contact link to send an email to specific user
    - Volunteers can edit hours per week and criminal background check
    - Organizations can edit POC email and areas of concern
    - Admins can create edit and delete all user accounts
    - Cannot go lower then having one admin account
    - Users are able to delete their own accounts
3. **Styling and Layout**
    - Application is responsive for different size screens
    - Navbar displays correct links depending on if a user is signed in or not
    - Footer display relevant links and social media
    - No broken links
    - Uniformity of items (links, buttons, etc)

## Technology Stack and Rationale

### **Technology Stack**

- **Ruby on Rails:** Chosen for its ease of use with MVC.
- **Sqllite3:** Selected for its ease of use and integration with RoR.
- **Vanilla CSS**: Used for responsive design and customization.
- **Devise:** Utilized for user authentication due to its ease of integration and its plethora of features.

### Rationale

This tech stack was choses as it provides a highly flexible and scalable base application as the platform expands and allows for additional features to be added as knowledge and experience of the developer grows. Ruby on rails is ideal for quick development and deployment of a skeleton application with the Devise Gem for a solid user authentication base.  Sqllite3 offers a flexible and robust database solution for storage of user information. Vanilla CSS offers detailed customization of the user interface without overcrowding the HTML documents when troubleshooting errors.   

## Testing Methods

- Allowed a small group of users to interact with the system to look for bugs and broken items

## Challenges Faced

- The implementation of the sign out link caused issued as the link_to helper method I used did not work and would not act as I thought it would. After searching for a solution I was able to find success in changing it to a button_to as link_to is for a GET request and button_to is for POST

## Lessons Learned

- One of the biggest lessons i learned is to keep things simple. I originally designed this project with 3 user models (Admin, Volunteer and Non Profit) however I found it extremely difficult to try and integrate them together for specific tasks. so in the end I combined them all into on user model with a role attribute to classify their roles. I had issues removing the three user models from the original application so i ended up just restarting from scratch and transferring over the views that I had created.

## Future Recommendations

- Change colour scheme or layout. personally I find that the colour scheme and layout look somewhat like an insurance company landing page.
- Develop a private message feature allowing users to reach out to each other on the platform instead of sending emails that could be sent to spam folders.
- As there is no user credential proof a user reviews page of some kind to build credibility of users for others to see.
