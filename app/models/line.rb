class Line < ActiveRecord::Base
  before_validation :update_end_rhyme, on: :create
  validates_presence_of :source_title, :content, :end_rhyme, allow_nil: false

  private

  def update_end_rhyme
    self.end_rhyme = find_end_rhyme
  end

  def find_end_rhyme
    self.content.gsub(/"|'|!|\.|\?|,|;|:/, "").split(" ").last
  end

end
