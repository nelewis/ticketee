class Asset < ActiveRecord::Base
  attr_accessible :asset

  has_attached_file :asset
  #:path=> {Rails.root + "files/#{Rails.env}/:id").to_s,
  #        :url=> "/files/:id"
  #         puts :path

  belongs_to :ticket
end
