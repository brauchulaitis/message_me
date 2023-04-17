// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as jquery from "jquery"
import "semantic-ui"
<<<<<<< HEAD

=======
import "@hotwired/turbo-rails"
>>>>>>> eda15b3eb6194959617cb1da814dafc39ea73715

$(document).on('turbo:load', function() {
    $('.ui.dropdown').dropdown();
})
