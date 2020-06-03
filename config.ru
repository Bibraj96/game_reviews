require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# the line bellow allows me to sned PATCH and DELETE requests
use Rack::MethodOverride

use UsersController
use ReviewsController
run ApplicationController
