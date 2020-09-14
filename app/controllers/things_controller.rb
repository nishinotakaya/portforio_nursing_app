class ThingsController < ApplicationController
	def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'file_name', #pdfファイルの名前。これがないとエラーが出ます
               layout: 'pdf_layouts.html', #レイアウトファイルの指定。views/layoutsが読まれます。
               template: 'things/show' #テンプレートファイルの指定。viewsフォルダが読み込まれます。
      end
		end
	end
	

	def pdf
    respond_to do |format|
      format.html { redirect_to action: :pdf, format: :pdf, debug: true }
      format.pdf do
        render pdf: 'pdf',
               layout: 'pdflayouts.html.slim',
               template: '/things/show.html.slim',
               encording: 'UTF-8',
               show_as_html: params.key?('debug')
      end
    end
  end
end
