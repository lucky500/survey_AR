class Survey < ActiveRecord::Base
  has_many(:questions)
  before_save(:camelcase_title)
  private def camelcase_title
    self.title = title.downcase.split(" ").each.map { |v| v.capitalize }.join(" ")
  end
end
