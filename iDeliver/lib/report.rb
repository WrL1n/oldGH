# frozen_string_literal: true

require_relative './host.rb'

class MyError < StandardError; end

# Не хотел дополнять стандартный класс
class Report < Array
  # Сортировочка по дате обновления,
  # сравнение дано на откуп стандартному из String
  def sort_by_oldest_updated
    sort_by_key(:updated_at)
  end

  def sort_by_oldest_updated!
    sort_by_key!(:updated_at)
  end

  def sort_by_newest_updated
    sort_by_key(:updated_at).reverse
  end

  def sort_by_newest_updated!
    sort_by_key!(:updated_at).reverse!
  end

  # Сортировочка по "величине" кода
  def sort_by_asc_code
    sort_by_key(:code)
  end

  def sort_by_asc_code!
    sort_by_key!(:code)
  end

  def sort_by_desc_code
    sort_by_key(:code).reverse
  end

  def sort_by_desc_code!
    sort_by_key!(:code).reverse!
  end

  # Грязно и в лоб, выбрал выриант с массивом аргументов для DRY,
  # чтобы небыло такого:
  # def sort_by_type(first_type = 'confirmed',
  #                  second_type = 'modified',
  #                  third_type = 'cancelled')
  def sort_by_type(*types)
    result_array = []
    # и такого
    # result_array << self.select { |hash| hash[:type] == first_type }
    # result_array << self.select { |hash| hash[:type] == second_type }
    # result_array << self.select { |hash| hash[:type] == third_type }
    types.each { |type| result_array << self.select { |hash| hash[:type] == type } }
    result_array.flatten
  end

  # Не только представил, но и реализовал!1
  def create_report_txt_file
    File.open('Report.txt', 'w+') { |file| file.write(self.readable_text) }
  end

  # ¯\_(ツ)_/¯
  def readable_text
    text = ''
    self.each { |h| text += "#{h[:code]}. Guest: #{h[:guest]}. #{h[:type].capitalize} #{h[:entity]} at \'#{h[:updated_at]}\'\n" }
    text
  end

  # Пусть будет
  def create_report_html_file
    File.open('Report.html', 'w+') { |file| file.write(self.readable_html) }
  end

  # ¯\_(ツ)_/¯
  def readable_html
    text = ''
    self.each { |h| text += "#{h[:code]}. Guest: #{h[:guest]}. #{h[:type].capitalize} #{h[:entity]} at \'#{h[:updated_at]}\'<br>" }
    text
  end

  # Отправляем на email
  def send_report_to_email(host)
    if host.is_a?(Host)
      Mailer.deliver(
        from: 'system@email.com',
        to: host.email,
        subject: 'Report',
        body: self.readable_html
      )
      # p host.email, self.readable_html, 'OK'
    else
      raise(MyError, 'IT IS NOT HOST!!')
    end
  end

  # Предусмотренное расширение функционала под телеграм
  # def send_report_to_telegram
  #   Telegramer.deliver(
  #     # I’ve been on a water fast for the last 6 days and am feeling great so far
  #   )
  # end

  private

  def sort_by_key(key)
    self.sort_by { |hash| hash[key] }
  end

  def sort_by_key!(key)
    self.sort_by! { |hash| hash[key] }
  end
end
