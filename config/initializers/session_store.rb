# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_2010_09_jasmine_demo_session',
  :secret      => 'c2d526fadd51986edeacf28bc4f2e4eac06ac1983f92baee63c51d5eba71b8fd93f3c7a9ed88f4687c05534218fb08be887972ac233b8ea58d8db5027d69730f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
