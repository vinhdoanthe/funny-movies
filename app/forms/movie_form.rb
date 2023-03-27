class Forms::MovieForm
  include ActiveModel::Model

  attr_accessor :link

  validates: :link, presence: true
end
