module Pdf
    def save(file_name, template, force_save=false)
      file_path = pdf_file_path(file_name)
  
      return file_path if exist_pdf?(file_path) && !force_save
  
      render pdf: file_name,
             layout: 'pdf.html.erb',
             template: template,
             encoding: 'UTF-8',
             page_size: 'A4',
             margin: {
               top: 10,
               bottom: 10,
               left: 20,
               right: 20
             },
             dpi: '300',
             save_to_file: file_path,
             save_only: true
  
      file_path
    end
  
    def show_html(file_name)
      render pdf: file_name,
             layout: 'pdf.html.erb',
             encoding: 'UTF-8',
             page_size: 'A4',
             margin: {
               top: 10,
               bottom: 10,
               left: 20,
               right: 20
             },
             dpi: '300',
             show_as_html: true
    end
  
    def exist_pdf?(file_name)
      File.exist?(pdf_file_path(file_name))
    end
  
    def exist_pdf_directory?
      File.directory?(pdfs_path)
    end
  
    def pdfs_path
      Rails.application.config.pdfs_path
    end
  
    def pdf_file_path(file_name)
      pdfs_path.join(file_name)
    end
  end