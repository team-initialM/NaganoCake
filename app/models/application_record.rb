class ApplicationRecord < ActiveRecord::Base
  include ActionView::Helpers::ApplicationHelper

  self.abstract_class = true
end
