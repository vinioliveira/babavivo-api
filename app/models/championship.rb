class Championship < ActiveRecord::Base

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_and_belongs_to_many :users
  has_and_belongs_to_many :metrics

  validates :name, :creator_id, :type_teams, presence: true
  validates :outfield_players, :numericality => { :greater_than => 0, :less_than_or_equal_to => 10 }
  validates :type_teams, inclusion: { in: %w( F S ) , message: "%{value} is not a valid type"}
  validates :draw_date, presence: true, if: :random_team?

  validate :has_at_least_on_metric

  def random_team?
    type_teams.eql? 'S'
  end


  #validates 
  def has_at_least_on_metric 
    errors.add(:metrics, 'must add at least one metric') if self.metrics.blank?
  end
end
