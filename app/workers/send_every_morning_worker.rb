class SendEveryMorningWorker
  include Sidekiq::Worker

  def perform(*args)
    IronMan::SendEveryDayService.call
  end
end
