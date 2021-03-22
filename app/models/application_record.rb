class ApplicationRecord < ActiveRecord::Base
  include ActionView::Helpers::ApplicationHelper

  self.abstract_class = true

  def fullname
    self.firstname + self.lastname
  end

end
