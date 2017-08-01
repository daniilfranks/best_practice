require_relative 'config/environment'

use StaticPagesController
use UsersController
use PostsController
run ApplicationController
