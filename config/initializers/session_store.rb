# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_500_session',
  :secret      => '1f6928d396c927931e3c152a7788fa4e604f6a2981cc1baa9192252973774b616b3cc6cf312a3ca41021d2700f7211b1b8dcabbbcba40a87981ab143ddff491a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
