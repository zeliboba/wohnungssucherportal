# -*- coding: utf-8; mode: ruby; -*-

require 'mechanize'

namespace :process do
  desc "Guess street from marktplaats.nl string"
  task :street => :environment do

    parts = ["straat", "laan", "weg", "kade", "plein"]

    Flat.where("street IS NULL").each do |f|
      puts "#{f.description.split.join(' ')}"
      street = nil
      if parts.upcase.any? { |w| f.description.upcase[w] }
        f.description.split.each do |d|
          street = d if parts.upcase.any?  { |w| d.upcase[w] }
        end
        f.street = street
        if f.save
          puts "done: street #{street}"
        else
          puts "fail: street #{street}"
        end
      else
        puts "no luck"
      end

    end

  end

  desc "Check availability on the website"
  task :check => :environment do

  end

  desc "Process everything for data"
  task :all => [:guess, :check]

end
