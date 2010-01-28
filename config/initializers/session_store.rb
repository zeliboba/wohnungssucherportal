# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wohnungssucher_session',
  :secret      => '446a4fb921bc347d11afd5b2426e96724f7b45ff612958c0fa817dd8e460017878c704aeeea66b2afeceb68b539cc38e0c85bd89dd51d3b1d4c0319bc934e2d7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
