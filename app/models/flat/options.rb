# -*- coding: utf-8 -*-
module Flat::Options
  STATES = %w(
    new
    contact
    contacted
    contacted_2nd_time
    want_to_visit
    visit_scheduled
    visited
    i_rejected
    not_available
  )
  
  # should this be in the model?
  # TODO put his into user preferences?
  SORT_OPTIONS = [
    ['added on', 'created_at DESC'],
    ['available on', 'available_on ASC'],
    ['cost', 'price/square_meters DESC'],
    ['m²', 'square_meters DESC'],
    ['price', 'price DESC'],
    ['priority', 'priority ASC'],
    ['city', 'city ASC'],
  ]
  
  DEFAULT_PRIORITY = 2
end
