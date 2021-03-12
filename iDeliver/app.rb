# frozen_string_literal: true

require_relative './lib/report.rb'

# arr = [
#   { code: 'A-001', guest: 'guest1@email.com', entity: 'reservation',
#     type: 'modified', created_at: '2019-06-08 23:06:45',
#     updated_at: '2019-06-08 23:40:02' },
#   { code: 'A-091', guest: 'guest1@email.com', entity: 'reservation',
#     type: 'confirmed', created_at: '2019-06-08 23:06:45',
#     updated_at: '2019-06-08 23:06:45' },
#   { code: 'A-301', guest: 'guest1@email.com', entity: 'reservation',
#     type: 'cancelled', created_at: '2019-06-08 23:06:45',
#     updated_at: '2019-06-08 23:59:59' },
#   { code: 'A-002', guest: 'guest2@email.com', entity: 'reservation',
#     type: 'confirmed', created_at: '2019-06-09 11:05:55',
#     updated_at: '2019-06-09 11:05:55' },
#   { code: 'A-002', guest: 'guest2@email.com', entity: 'reservation',
#     type: 'modified', created_at: '2019-06-09 11:05:55',
#     updated_at: '2019-06-09 12:15:55' },
#   { code: 'B-999', guest: 'guest3@email.com', entity: 'reservation',
#     type: 'modified', created_at: '2019-06-08 23:16:15',
#     updated_at: '2019-06-08 23:41:12' }
# ]

# Сортировка
# ------------------------------------------------------------------------------
# report = Report.new(arr)
# # report.each { |x| puts x[:updated_at] }
# report.sort_by_newest_updated    # .each { |x| puts x[:updated_at] }
# report.sort_by_oldest_updated    # .each { |x| puts x[:updated_at] }
# report.sort_by_newest_updated!   # .each { |x| puts x[:updated_at] }
# report.sort_by_oldest_updated!   # .each { |x| puts x[:updated_at] }

# # report.each {|x| puts x[:code]}
# report.sort_by_asc_code    # .each { |x| puts x[:code] }
# report.sort_by_desc_code   # .each { |x| puts x[:code] }
# report.sort_by_asc_code!   # .each { |x| puts x[:code] }
# report.sort_by_desc_code!  # .each { |x| puts x[:code] }

# p report.sort_by_type('modified', 'confirmed', 'cancelled')
# p report.sort_by_type('confirmed', 'cancelled', 'modified')
# ------------------------------------------------------------------------------

# Создание файлов
# ------------------------------------------------------------------------------
# report = Report.new(arr)
# report.create_report_txt_file
# report.create_report_html_file
# ------------------------------------------------------------------------------

# Отправка
# ------------------------------------------------------------------------------
# report = Report.new(arr)
# host = Host.new
# # host = 'blabla'   # Вызов ошибки MyError
# report.send_report_to_email(host)
# ------------------------------------------------------------------------------
