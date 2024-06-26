require 'sidekiq/api'
class NotificationJob < ApplicationJob
  queue_as :default

  def perform(event_id)
    event = Event.find_by(id: event_id)
    return unless event && event.user.line_user_id.present?

    message_text = "「#{event.title}」の時間です"
    LineNotifyService.send_message(event.user.line_user_id, message_text)
  end

  def self.cancel(job_id)
    scheduled_set = Sidekiq::ScheduledSet.new
    job = scheduled_set.find { |j| j.args.any? { |arg| arg['job_id'] == job_id } }
    return unless job

    job.delete
  end
end
