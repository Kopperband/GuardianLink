# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo-rails.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "@hotwired/turbo-rails", to: "turbo.js"
pin "controllers", to: "controllers/*"


pin "application.js", to: "app/javascript/application.js" # Import application.js
pin "jquery.js", to: "https://code.jquery.com/jquery-3.6.0.min.js" # Import jQuery
