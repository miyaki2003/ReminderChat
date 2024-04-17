class Event < ApplicationRecord
  #belongs_to :user
  attr_accessor :start_date, :start_time_part, :end_date, :end_time_part, :notify_date, :notify_time_part

  before_validation :set_datetime_attributes

  validates :title, presence: true
  validate :start_must_be_before_end_time
  validate :notification_time_must_be_in_the_future, if: -> { line_notify && notify_time.present? }

  private

  def set_datetime_attributes
    self.start_time = Time.zone.parse("#{start_date} #{start_time_part}") if start_date.present? && start_time_part.present?
    self.end_time = Time.zone.parse("#{end_date} #{end_time_part}") if end_date.present? && end_time_part.present?
    self.notify_time = Time.zone..parse("#{notify_date} #{notify_time_part}") if notify_date.present? && notify_time_part.present?
  end

  def start_must_be_before_end_time
    errors.add(:end_time, 'must be after the start time') if start_time && end_time && start_time > end_time
  end

  def notification_time_must_be_in_the_future
    errors.add(:notify_time, 'must be set in the future') if notify_time && notify_time < Time.current
  end
  def notification_time_must_be_in_the_future
    errors.add(:notify_time, 'must be set at least one minute in the future') if notify_time <= Time.current + 1.minute
  end
end