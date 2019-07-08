require 'csv'
require 'date'

CSV.generate do |csv|
  column_names = %w(date started_at finished_at)
  csv << column_names
  @attendances.each do |day|
    column_values = [
      day.worked_on.to_s(:date),
        if day.started_at.present?
          day.started_at.strftime("%R")
        end,
        if day.started_at.present?
          day.finished_at.strftime("%R")
        end,
    ]
    csv << column_values
  end
end
