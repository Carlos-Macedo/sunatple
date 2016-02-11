class Purchase < ActiveRecord::Base
  validates :ruc,
            :year,
            :month,
            :periodo,
            :cuo,
            :correlativo,
            :fecha_emision,
            :serie,
            :numero,
            presence: true
end
