# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_word_game_session',
  :secret      => '2a52ae27e5dac67c0e6c10a13be3399514f3dc3589529cf4f3cd0773437a7b4bed8ef20248347a7b8e9d76804698c0065095c21d814a65829c4d0348a3963224'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
