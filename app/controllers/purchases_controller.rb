class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.where(ruc: current_ruc, year: current_year, month: current_month)
    if params[:delete] == "all"
      Purchase.all.delete_all
    end
    if params[:type] == "080100"
      @id_libro = "080100"
      @id_contenido = "1"
    elsif params[:type] == "080200"
      @id_libro = "080200"
      @id_contenido = @purchases.where(no_domiciliado: true).blank? ? "0" : "1"
    elsif params[:type] == "080300"
      @id_libro = "080300"
      @id_contenido = "0"
    end
    respond_to do |format|
      format.html
      filename_txt = "LE#{current_ruc}#{current_year.to_s}#{current_month.to_s.rjust(2, '0')}00#{@id_libro}001#{@id_contenido}11.TXT"
      format.txt do
        response.headers['Content-Disposition'] = "attachment; filename=#{filename_txt}"
        render "purchases/index.txt.erb"
      end
    end
  end

  def subir_excel_purchase

    if params[:file]
      file = params[:file]
      if File.extname(file.original_filename) == ".xlsx"
        spreadsheet = Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore) #open_spreadsheet(params[:file])
        rows = (10..spreadsheet.last_row)
        rows.each do |i|
          purchase = Purchase.new
          purchase.ruc = current_ruc
          purchase.year = current_year
          purchase.month = current_month
          purchase.periodo = "#{current_year}#{current_month.to_s.rjust(2, "0")}00"
          purchase.cuo = spreadsheet.cell(i, 1)
          purchase.correlativo = "M#{spreadsheet.cell(i, 1).to_s[4..-1]}"
          purchase.fecha_emision = spreadsheet.cell(i, 2)
          purchase.fecha_vencimiento = spreadsheet.cell(i, 3)
          purchase.tipo_comprobante = spreadsheet.cell(i, 4)
          purchase.serie = spreadsheet.cell(i, 5).to_s.split(' ').first.to_s.sub(/^[0:]*/, "").strip
          purchase.anho_dua_dsi = ""
          purchase.numero = spreadsheet.cell(i, 5).to_s.split(' ').last.to_s.sub(/^[0:]*/, "").strip
          purchase.numero_final = ""
          if spreadsheet.cell(i, 6).to_s.split(' ').first == "0"
            tipo_doc = 6
          elsif spreadsheet.cell(i, 6).to_s.split(' ').first == "01"
            tipo_doc = 1
          end
          purchase.tipo_documento = tipo_doc
          purchase.numero_ruc = spreadsheet.cell(i, 6).to_s.split(' ').last
          purchase.denominacion = spreadsheet.cell(i, 7)
          purchase.base_gravada_1 = spreadsheet.cell(i, 8)
          purchase.igv_1 = spreadsheet.cell(i, 9)
          purchase.base_gravada_2 = spreadsheet.cell(i, 10)
          purchase.igv_2 = spreadsheet.cell(i, 11)
          purchase.base_gravada_3 = ""
          purchase.igv_3 = ""
          purchase.no_gravadas = spreadsheet.cell(i, 12)
          purchase.isc = ""
          purchase.otros = ""
          purchase.total = spreadsheet.cell(i, 13)
          purchase.codigo_moneda = spreadsheet.cell(i, 14).blank? ? "PEN" : "USD"
          purchase.tipo_cambio = spreadsheet.cell(i, 15).blank? ? "1.000" : spreadsheet.cell(i, 15)
          purchase.fecha_comprobante_modificado = spreadsheet.cell(i, 18)
          purchase.tipo_comprobante_modificado = spreadsheet.cell(i, 19)
          purchase.serie_comprobante_modificado = spreadsheet.cell(i, 20).to_s.split(' ').first.to_s.sub(/^[0:]*/, "").strip
          purchase.codigo_dependencia_aduanas_modificado = ""
          purchase.numero_comprobante_modificado = spreadsheet.cell(i, 20).to_s.split(' ').last.to_s.sub(/^[0:]*/, "").strip
          purchase.fecha_emision_constancia_detraccion = spreadsheet.cell(i, 16)
          purchase.numero_constancia_detraccion = spreadsheet.cell(i, 17)
          purchase.comprobante_pago_sujeto_a_retencion = ""
          purchase.clasificacion_de_bienes_adquiridos = ""
          purchase.identificacion_contrato_proyecto = ""
          purchase.inconsistencia_tipo_de_cambio = ""
          purchase.inconsistencia_proveedor_no_habidos = ""
          purchase.inconsistencia_proveedor_renucias = ""
          purchase.inconsistecia_por_dni = ""
          purchase.indicador_de_bancarizacion = ""
          purchase.estado_oportunidad_de_anotacion = ""
          purchase.no_domiciliado = spreadsheet.cell(i, 4) == "91" ? true : false
          purchase.no_domiciliado_pais = spreadsheet.cell(i, 27)
          purchase.no_domiciliado_denominacion = spreadsheet.cell(i, 28)
          purchase.no_domiciliado_domicilio = spreadsheet.cell(i, 29)
          purchase.no_domiciliado_identificacion = spreadsheet.cell(i, 30)
          purchase.no_domiciliado_tipo_de_renta = spreadsheet.cell(i, 31)
          purchase.save
          unless purchase.save
            flash[:warning] = "Error #{purchase.errors.full_messages} - FILA #{i}"
            redirect_to root_path and return
          end
        end
      else
        flash[:warning] = "Archivo no soportado: #{file.original_filename}. DEBE SER EXCEL CON EXTENSÍON .XLSX"
        redirect_to purchases_path
      end
      flash[:success] = "Subido"
      redirect_to purchases_path
    end
  end

end
