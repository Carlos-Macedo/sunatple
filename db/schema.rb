# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160210031344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "purchases", force: :cascade do |t|
    t.string   "ruc"
    t.string   "year"
    t.string   "month"
    t.string   "periodo"
    t.string   "cuo"
    t.string   "correlativo"
    t.date     "fecha_emision"
    t.date     "fecha_vencimiento"
    t.string   "tipo_comprobante"
    t.string   "serie"
    t.string   "anho_dua_dsi"
    t.string   "numero"
    t.string   "numero_final"
    t.string   "tipo_documento"
    t.string   "numero_ruc"
    t.string   "denominacion"
    t.decimal  "base_gravada_1",                        precision: 12, scale: 2
    t.decimal  "igv_1",                                 precision: 12, scale: 2
    t.decimal  "base_gravada_2",                        precision: 12, scale: 2
    t.decimal  "igv_2",                                 precision: 12, scale: 2
    t.decimal  "base_gravada_3",                        precision: 12, scale: 2
    t.decimal  "igv_3",                                 precision: 12, scale: 2
    t.decimal  "no_gravadas",                           precision: 12, scale: 2
    t.decimal  "isc",                                   precision: 12, scale: 2
    t.decimal  "otros",                                 precision: 12, scale: 2
    t.decimal  "total",                                 precision: 12, scale: 2
    t.string   "codigo_moneda"
    t.decimal  "tipo_cambio",                           precision: 12, scale: 3
    t.date     "fecha_comprobante_modificado"
    t.string   "tipo_comprobante_modificado"
    t.string   "serie_comprobante_modificado"
    t.string   "codigo_dependencia_aduanas_modificado"
    t.string   "numero_comprobante_modificado"
    t.date     "fecha_emision_constancia_detraccion"
    t.string   "numero_constancia_detraccion"
    t.string   "comprobante_pago_sujeto_a_retencion"
    t.string   "clasificacion_de_bienes_adquiridos"
    t.string   "identificacion_contrato_proyecto"
    t.string   "inconsistencia_tipo_de_cambio"
    t.string   "inconsistencia_proveedor_no_habidos"
    t.string   "inconsistencia_proveedor_renucias"
    t.string   "inconsistecia_por_dni"
    t.string   "indicador_de_bancarizacion"
    t.string   "estado_oportunidad_de_anotacion"
    t.boolean  "no_domiciliado",                                                 default: false
    t.string   "no_domiciliado_pais"
    t.string   "no_domiciliado_denominacion"
    t.string   "no_domiciliado_domicilio"
    t.string   "no_domiciliado_identificacion"
    t.string   "no_domiciliado_tipo_de_renta"
    t.datetime "created_at",                                                                     null: false
    t.datetime "updated_at",                                                                     null: false
  end

  create_table "sales", force: :cascade do |t|
    t.string   "ruc"
    t.string   "year"
    t.string   "month"
    t.string   "periodo"
    t.string   "cuo"
    t.string   "correlativo"
    t.date     "fecha_emision"
    t.date     "fecha_vencimiento"
    t.string   "tipo_comprobante"
    t.string   "serie"
    t.string   "numero"
    t.string   "numero_final"
    t.string   "tipo_documento"
    t.string   "numero_ruc"
    t.string   "denominacion"
    t.decimal  "exportacion",                      precision: 12, scale: 2
    t.decimal  "gravada",                          precision: 12, scale: 2
    t.decimal  "descuento_gravada"
    t.decimal  "igv",                              precision: 12, scale: 2
    t.decimal  "descuento_igv"
    t.decimal  "exonerada",                        precision: 12, scale: 2
    t.decimal  "inafecta"
    t.decimal  "isc",                              precision: 12, scale: 2
    t.decimal  "gravada_arroz_pilado"
    t.decimal  "impuesto_ventas_arroz_pilado",     precision: 12, scale: 2
    t.decimal  "otros"
    t.decimal  "total",                            precision: 12, scale: 2
    t.string   "codigo_moneda"
    t.decimal  "tipo_cambio",                      precision: 12, scale: 3
    t.date     "fecha_comprobante_modificado"
    t.string   "tipo_comprobante_modificado"
    t.string   "serie_comprobante_modificado"
    t.string   "numero_comprobante_modificado"
    t.string   "identificacion_contrato_proyecto"
    t.string   "inconsistencia_tipo__cambio"
    t.string   "indicador_comprobante_cancelado"
    t.string   "estado_oportunidad_de_anotacion"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

end
