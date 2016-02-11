class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :ruc
      t.string :year
      t.string :month

      t.string :periodo
      t.string :cuo
      t.string :correlativo
      t.date :fecha_emision
      t.date :fecha_vencimiento
      t.string :tipo_comprobante
      t.string :serie
      t.string :numero
      t.string :numero_final
      t.string :tipo_documento
      t.string :numero_ruc
      t.string :denominacion
      t.decimal :exportacion, precision: 12, scale: 2
      t.decimal :gravada, precision: 12, scale: 2
      t.decimal :descuento_gravada
      t.decimal :igv, precision: 12, scale: 2
      t.decimal :descuento_igv
      t.decimal :exonerada, precision: 12, scale: 2
      t.decimal :inafecta
      t.decimal :isc, precision: 12, scale: 2
      t.decimal :gravada_arroz_pilado
      t.decimal :impuesto_ventas_arroz_pilado, precision: 12, scale: 2
      t.decimal :otros
      t.decimal :total, precision: 12, scale: 2
      t.string :codigo_moneda
      t.decimal :tipo_cambio, precision: 12, scale: 3
      t.date :fecha_comprobante_modificado
      t.string :tipo_comprobante_modificado
      t.string :serie_comprobante_modificado
      t.string :numero_comprobante_modificado
      t.string :identificacion_contrato_proyecto
      t.string :inconsistencia_tipo__cambio
      t.string :indicador_comprobante_cancelado
      t.string :estado_oportunidad_de_anotacion


      t.timestamps null: false
    end
  end
end
