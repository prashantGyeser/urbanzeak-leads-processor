class HardWorker

  include Sidekiq::Worker

  def perform(name, count)
    logger.info "Cool it is starting the sidekiq process"
  end

end