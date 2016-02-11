class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
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
      t.string :anho_dua_dsi
      t.string :numero
      t.string :numero_final
      t.string :tipo_documento
      t.string :numero_ruc
      t.string :denominacion
      t.decimal :base_gravada_1, precision: 12, scale: 2
      t.decimal :igv_1, precision: 12, scale: 2
      t.decimal :base_gravada_2, precision: 12, scale: 2
      t.decimal :igv_2, precision: 12, scale: 2
      t.decimal :base_gravada_3, precision: 12, scale: 2
      t.decimal :igv_3, precision: 12, scale: 2
      t.decimal :no_gravadas, precision: 12, scale: 2
      t.decimal :isc, precision: 12, scale: 2
      t.decimal :otros, precision: 12, scale: 2
      t.decimal :total, precision: 12, scale: 2
      t.string :codigo_moneda
      t.decimal :tipo_cambio, precision: 12, scale: 3
      t.date :fecha_comprobante_modificado
      t.string :tipo_comprobante_modificado
      t.string :serie_comprobante_modificado
      t.string :codigo_dependencia_aduanas_modificado
      t.string :numero_comprobante_modificado
      t.date :fecha_emision_constancia_detraccion
      t.string :numero_constancia_detraccion
      t.string :comprobante_pago_sujeto_a_retencion
      t.string :clasificacion_de_bienes_adquiridos
      t.string :identificacion_contrato_proyecto
      t.string :inconsistencia_tipo_de_cambio
      t.string :inconsistencia_proveedor_no_habidos
      t.string :inconsistencia_proveedor_renucias
      t.string :inconsistecia_por_dni
      t.string :indicador_de_bancarizacion
      t.string :estado_oportunidad_de_anotacion
      t.boolean :no_domiciliado, default: false

      t.timestamps null: false
    end
  end
end
