class Line < ActiveRecord::Base
  validates_presence_of :source_title, :content, :end_rhyme, allow_nil: false
  before_validation :update_end_rhyme, on: :create

  def initialize(source_title, content)
    @source_title = source_title
    @content = content
  end

  private

  def update_end_rhyme
    self.end_rhyme = find_end_rhyme
  end

  def find_end_rhyme
    self.content.gsub(/"|'|!|\.|\?|,|;|:/, "").split(" ").last
  end

end
