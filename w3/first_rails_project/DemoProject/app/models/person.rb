# Table "public.people"
# Column   |            Type             |                      Modifiers
# ------------+-----------------------------+-----------------------------------------------------
# id         | integer                     | not null default nextval('people_id_seq'::regclass)
# name       | character varying           | not null
# house_id   | integer                     |
# created_at | timestamp without time zone |
# updated_at | timestamp without time zone |
# Indexes:
# "people_pkey" PRIMARY KEY, btree (id)

class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :house_id, presence: true

  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'
end
