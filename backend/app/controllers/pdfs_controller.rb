class PdfsController < ActionController::Base
  def get_model
    @articles = Article.fivebestsellercantitybyuser(params[:iduser])
=begin
      puts "get_model Fecha inicio"
      puts params[:start_date]
      puts "get_model Fecha fin" 
      puts params[:ending_date]
      puts "get_model Valor maximo"
      puts params[:max_price]
      puts "get_model Valor minimo"
      puts params[:min_price]
=end

  end


  def  show
=begin      
      puts "Fecha inicio"
      puts params[:start_date]
      puts "Fecha fin" 
      puts params[:ending_date]
      puts "Valor maximo"
      puts params[:max_price]
      puts "Valor minimo"
      puts params[:min_price]
=end      
      get_model
		respond_to do |format|
		    format.html
			format.pdf do
				render pdf: "template", template: "../views/pdfs/template"  
			end
		end
  end
end