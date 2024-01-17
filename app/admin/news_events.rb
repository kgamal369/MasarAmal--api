# frozen_string_literal: true

ActiveAdmin.register NewsEvent do
  permit_params :header, :text, :date_of_events, :last_modified
end
