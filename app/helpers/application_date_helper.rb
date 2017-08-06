module ApplicationDateHelper

  def time_from_now_in_words(from_time, options = {})
    if from_time
      now = Time.new # rubocop:disable Rails/TimeZone
      distance_of_time_in_words(from_time, now, options) + (from_time > now ? ' from now' : ' ago')
    end
  end

  def datetime_with_format(datetime, formats = nil)
    return nil unless datetime
    formats = I18n.t('time.formats.default') if formats.nil?
    datetime.strftime(formats)
  rescue
    raise ArgumentError.new('Datetime invalid')
  end

end
