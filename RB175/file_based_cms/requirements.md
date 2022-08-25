1. Getting Started
   _Requirements_

- create Gemfile
- require Sinatra and sinatra-contrib
- create root route and return string `Getting Started.`

2. Adding an Index Page
   _Requirements_
   When a user visits the home page, they should see a list of the documents in the CMS: history.txt, changes.txt and about.txt:

   - use `Dir.global` to access all the files in the system
   - create a view with unordered list of all files

   Editing Document Content

   - add button to get `/:filename` route that links to filename edit page
   - create get `/:filename/edit` route
     -render the new edit view
   - create `edit` erb view
     - render a textarea with prefilled value of the current content
     - inside of a form that submits to the post route `/:filename`
   - create post `/:filename` route
     - the textarea needs to be written and saved to the file
