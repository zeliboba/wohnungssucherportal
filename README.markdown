# Usage notes

## User profile

The user profile can be changed using the `Edit` link located next to the
`Sign out` link at the bottom of the page.  It allows to change the email,
password and the default location (city and country).


# Installation notes

## Ubuntu 10.04

Following the guide on https://help.ubuntu.com/community/RubyOnRails install
the required packages for MySQL:

	sudo apt-get install mysql-server mysql-client 
	sudo apt-get install libmysql-ruby libmysqlclient-dev

Or install entire LAMS stack https://help.ubuntu.com/community/ApacheMySQLPHP

	sudo apt-get install tasksel
	sudo tasksel install lamp-server

After that create the database, make sure that the required gems are
installed, and run the server:

	mysql --force --user root --password < config/database.sql
	bundle install 
	bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rails server


---

latitude  => Breite => Nord-Süd
longitude => Länge  => Ost-West
