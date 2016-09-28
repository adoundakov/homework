# Table "public.houses"
# Column   |            Type             |                      Modifiers
# ------------+-----------------------------+-----------------------------------------------------
# id         | integer                     | not null default nextval('houses_id_seq'::regclass)
# address    | character varying           | not null
# created_at | timestamp without time zone |
# updated_at | timestamp without time zone |
# Indexes:
# "houses_pkey" PRIMARY KEY, btree (id)


class House < ActiveRecord::Base
  validates :address, presence: true

  has_many :residents,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Person'
end
