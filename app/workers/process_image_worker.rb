class ProcessImageWorker
  include Sidekiq::Worker

  sidekiq_options :queue => :process_image, :retry => true, :backtrace => true

  def perform(attributes)
    image =  Uploadbox.const_get(attributes['upload_class_name']).find(attributes['id']).process
    # return unless image
    # image.process
  end

end
