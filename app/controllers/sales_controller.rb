class SalesController < ApplicationController
  def index
    @sales = Sale.where(ruc: current_ruc, year: current_year, month: current_month)
    if params[:delete] == "all"
      Sale.all.delete_all
    end
    if params[:type] == "140100"
      @id_libro = "140100"
      @id_contenido = "1"
    elsif params[:type] == "140200"
      @id_libro = "140200"
      @id_contenido = "0"
    end
    respond_to do |format|
      format.html
      filename_txt = "LE#{current_ruc}#{current_year}#{current_month.rjust(2, '0')}00#{@id_libro}001#{@id_contenido}11.TXT"
      format.txt do
        response.headers['Content-Disposition'] = "attachment; filename=#{filename_txt}"
        render "sales/index.txt.erb"
      end
    end
  end

  def subir_excel_sale

    if params[:file]
      file = params[:file]
      if File.extname(file.original_filename) == ".xlsx"
        spreadsheet = Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore) #open_spreadsheet(params[:file])
        rows = (10..spreadsheet.last_row)
        rows.each do |i|
          sale = Sale.new
          sale.ruc = current_ruc
          sale.year = current_year
          sale.month = current_month
          sale.periodo = "#{current_year}#{current_month.rjust(2, "0")}00"
          sale.cuo = spreadsheet.cell(i, 1)
          sale.correlativo = "M#{spreadsheet.cell(i, 1).to_s[4..-1]}"
          sale.fecha_emision = spreadsheet.cell(i, 2)
          sale.fecha_vencimiento = spreadsheet.cell(i, 3)
          sale.tipo_comprobante = spreadsheet.cell(i, 4)
          sale.serie = spreadsheet.cell(i, 5).to_s.split(' ').first
          sale.numero = spreadsheet.cell(i, 5).to_s.split(' ').last
          sale.numero_final = ""
          if spreadsheet.cell(i, 6).to_s.split(' ').first == "01"
            tipo_doc = 1
          elsif spreadsheet.cell(i, 6).to_s.split(' ').first == "00"
            tipo_doc = 0
          elsif spreadsheet.cell(i, 6).to_s.split(' ').first == "06"
            tipo_doc = 6
          elsif spreadsheet.cell(i, 6).to_s.split(' ').first == "07"
            tipo_doc = 7
          end
          sale.tipo_documento = tipo_doc
          sale.numero_ruc = spreadsheet.cell(i, 6).to_s.split(' ').last[0..10]
          sale.denominacion = spreadsheet.cell(i, 7)
          sale.exportacion = spreadsheet.cell(i, 8)
          sale.gravada = spreadsheet.cell(i, 9)
          sale.descuento_gravada = ""
          sale.igv = spreadsheet.cell(i, 11)
          sale.descuento_igv = ""
          sale.exonerada = spreadsheet.cell(i, 10)
          sale.inafecta = ""
          sale.isc = ""
          sale.gravada_arroz_pilado = ""
          sale.impuesto_ventas_arroz_pilado = ""
          sale.otros = spreadsheet.cell(i, 12)
          sale.total = spreadsheet.cell(i, 13)
          sale.codigo_moneda = spreadsheet.cell(i, 14).blank? ? "PEN" : "USD"
          sale.tipo_cambio = spreadsheet.cell(i, 15).blank? ? "1.000" : spreadsheet.cell(i, 15)
          sale.fecha_comprobante_modificado = spreadsheet.cell(i, 16)
          sale.tipo_comprobante_modificado = spreadsheet.cell(i, 17)
          sale.serie_comprobante_modificado = spreadsheet.cell(i, 18).to_s.split(' ').first
          sale.numero_comprobante_modificado = spreadsheet.cell(i, 18).to_s.split(' ').last
          sale.identificacion_contrato_proyecto = ""
          sale.inconsistencia_tipo__cambio = ""
          sale.indicador_comprobante_cancelado = ""
          sale.estado_oportunidad_de_anotacion = ""
          unless sale.save
            flash[:warning] = "Error #{sale.errors.full_messages}"
            redirect_to root_path and return
          end
        end
      else
        flash[:warning] = "Archivo no soportado: #{file.original_filename}. DEBE SER EXCEL CON EXTENSÍON .XLSX"
        redirect_to sales_path
      end
      flash[:success] = "Subido"
      redirect_to sales_path
    end
  end

end
