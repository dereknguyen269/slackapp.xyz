class IronManWorker
  include Sidekiq::Worker

  def perform(*args)
    IronMan::RandPhotoService.call
  end
end
